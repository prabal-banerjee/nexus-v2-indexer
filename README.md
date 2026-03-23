# Nexus Vault Indexer

An [Envio HyperIndex](https://docs.envio.dev) project that indexes Vault `Deposit` and `Fulfilment` events across multiple EVM chains. Once deployed, it provides a hosted GraphQL endpoint that any service (e.g. the [Nexus Explorer](../explorer/)) can query for on-chain event data.

## What it indexes

| Event | Fields |
|-------|--------|
| `Deposit(bytes32 indexed requestHash, address from)` | requestHash, emitter, txHash, blockNumber, chainId |
| `Fulfilment(bytes32 indexed requestHash, address from, address solver)` | requestHash, emitter, solver, txHash, blockNumber, chainId |

Chains: Sepolia, Arbitrum Sepolia, Base Sepolia, Polygon Amoy.

## Getting Started

### Prerequisites

- Node.js 18+
- [Envio CLI](https://docs.envio.dev/docs/HyperIndex/installation)
- Access to the Nexus statekeeper (for vault address discovery)

### 1. Install dependencies

```bash
cd tooling/vault-indexer
npm install
```

### 2. Initialize config

The init script fetches vault contract addresses from the statekeeper and writes `config.yaml` with real addresses and start blocks.

```bash
# Fetch vault addresses and write config.yaml
npm run init

# Preview without writing
npm run init:dry-run

# Use a custom statekeeper URL
STATEKEEPER_URL=http://localhost:3000 npm run init
```

### 3. Generate types

```bash
npm run codegen
```

### 4. Test locally

```bash
npm run dev
```

This starts a local Envio instance. You can query the local GraphQL endpoint to verify events are being indexed.

### 5. Deploy

Push the repository to GitHub. Envio auto-deploys and provides a hosted GraphQL endpoint URL.

To use this endpoint with the Nexus Explorer, set `envioUrl` in the explorer's `explorer-config.json` or the `ENVIO_URL` environment variable.

## Project Structure

```
tooling/vault-indexer/
├── config.yaml             # Envio config (chains, contracts, events)
├── schema.graphql          # VaultEvent entity definition
├── src/
│   └── EventHandlers.ts    # Deposit + Fulfilment event handlers
├── init.ts                 # Init script (fetches vault addresses from statekeeper)
└── package.json
```

## GraphQL Schema

```graphql
type VaultEvent @entity {
  id: ID!
  requestHash: String! @index
  eventType: String!       # "deposit" or "fulfillment"
  chainId: Int!
  txHash: String!
  blockNumber: Int!
  logIndex: Int!
  emitter: String!
  solver: String           # only set for fulfillment events
  blockTimestamp: Int!
}
```

### Example query

```graphql
query {
  VaultEvent(where: { requestHash: { _eq: "0xabc..." } }) {
    eventType
    chainId
    txHash
    blockNumber
    emitter
    solver
  }
}
```
