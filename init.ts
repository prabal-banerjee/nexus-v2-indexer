#!/usr/bin/env npx tsx
/**
 * Envio indexer init script.
 *
 * Fetches vault addresses from the statekeeper for each configured chain,
 * trims H256 → EVM addresses, and writes (or updates) config.yaml with the
 * real contract addresses and sensible start_block values.
 *
 * Usage:
 *   npx tsx init.ts                                         # uses default statekeeper URL
 *   STATEKEEPER_URL=http://localhost:3000 npx tsx init.ts   # custom statekeeper
 *   npx tsx init.ts --dry-run                               # print config, don't write
 */

import { readFileSync, writeFileSync } from 'fs'
import { resolve, dirname } from 'path'
import { fileURLToPath } from 'url'

// ---------------------------------------------------------------------------
// Config
// ---------------------------------------------------------------------------

const __dirname = dirname(fileURLToPath(import.meta.url))
const CONFIG_PATH = resolve(__dirname, 'config.yaml')

const STATEKEEPER_URL =
  process.env.STATEKEEPER_URL || 'https://nexus-v2.testnet.avail.so/statekeeper'

// Chains we want to index — id is the EVM chain_id
const CHAINS = [
  { id: 11155111, name: 'Sepolia' },
  { id: 421614, name: 'Arbitrum Sepolia' },
  { id: 84532, name: 'Base Sepolia' },
  { id: 80002, name: 'Polygon Amoy' },
] as const

const DRY_RUN = process.argv.includes('--dry-run')

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

/** Trim a 32-byte H256 address (0x + 64 hex) to a 20-byte EVM address (0x + 40 hex). */
function h256ToEvmAddress(h256: string): string {
  if (h256.startsWith('0x') && h256.length === 66) {
    return '0x' + h256.slice(-40)
  }
  return h256
}

interface ChainStateResponse {
  data: {
    universe: string
    chain_id: number
    vault_address: string
    name: string
    active: boolean
    block_number: number
    timestamp: number
  }
}

interface VaultInfo {
  chainId: number
  chainName: string
  vaultAddress: string
  latestBlock: number
}

async function fetchVaultInfo(chainId: number, chainName: string): Promise<VaultInfo | null> {
  const url = `${STATEKEEPER_URL}/state`
  try {
    const res = await fetch(url, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ type: 'chain', universe: 'evm', chain_id: chainId }),
    })

    if (!res.ok) {
      console.error(`  [${chainName}] statekeeper returned ${res.status}`)
      return null
    }

    const json = (await res.json()) as ChainStateResponse
    const data = json.data
    if (!data?.vault_address) {
      console.error(`  [${chainName}] no vault_address in response`)
      return null
    }

    return {
      chainId,
      chainName,
      vaultAddress: h256ToEvmAddress(data.vault_address),
      latestBlock: data.block_number,
    }
  } catch (e) {
    console.error(`  [${chainName}] fetch failed:`, (e as Error).message)
    return null
  }
}

// ---------------------------------------------------------------------------
// YAML generation
// ---------------------------------------------------------------------------

function generateConfigYaml(vaults: VaultInfo[]): string {
  const networkEntries = vaults.map((v) => {
    // Start indexing from a few hundred blocks before the latest known block.
    // This gives a buffer to catch any recent events that haven't been processed,
    // while avoiding indexing from genesis which would be extremely slow.
    const startBlock = Math.max(0, v.latestBlock - 500)

    return [
      `  - id: ${v.chainId}      # ${v.chainName}`,
      `    start_block: ${startBlock}`,
      `    contracts:`,
      `      - name: Vault`,
      `        address:`,
      `          - "${v.vaultAddress}"`,
    ].join('\n')
  })

  return [
    'name: nexus-vault-indexer',
    'contracts:',
    '  - name: Vault',
    '    handler: src/EventHandlers.ts',
    '    events:',
    '      - event: Deposit(bytes32 indexed requestHash, address from)',
    '      - event: Fulfilment(bytes32 indexed requestHash, address from, address solver)',
    'networks:',
    ...networkEntries,
    'unordered_multichain_mode: true',
    '',
  ].join('\n')
}

// ---------------------------------------------------------------------------
// Main
// ---------------------------------------------------------------------------

async function main() {
  console.log(`Fetching vault addresses from ${STATEKEEPER_URL} ...\n`)

  const results = await Promise.all(
    CHAINS.map((c) => fetchVaultInfo(c.id, c.name))
  )

  const vaults = results.filter((v): v is VaultInfo => v !== null)

  if (vaults.length === 0) {
    console.error('\nNo vault addresses found. Check the statekeeper URL and chain config.')
    process.exit(1)
  }

  console.log(`\nResolved ${vaults.length}/${CHAINS.length} chains:\n`)
  for (const v of vaults) {
    console.log(`  ${v.chainName} (${v.chainId}): vault=${v.vaultAddress}  block=${v.latestBlock}`)
  }

  const yaml = generateConfigYaml(vaults)

  if (DRY_RUN) {
    console.log('\n--- config.yaml (dry run) ---\n')
    console.log(yaml)
    return
  }

  writeFileSync(CONFIG_PATH, yaml, 'utf-8')
  console.log(`\nWrote ${CONFIG_PATH}`)
  console.log('\nNext steps:')
  console.log('  cd tooling/explorer/indexer')
  console.log('  npx envio codegen        # generate types from config')
  console.log('  npx envio dev            # test locally')
  console.log('  # Push to GitHub → Envio auto-deploys, gives you a GraphQL URL')
  console.log('  # Set envioUrl in explorer-config.json or ENVIO_URL env var')
}

main().catch((e) => {
  console.error('Fatal:', e)
  process.exit(1)
})
