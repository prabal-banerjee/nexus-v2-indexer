
type hyperSyncConfig = {endpointUrl: string}
type hyperFuelConfig = {endpointUrl: string}

@genType.opaque
type rpcConfig = {
  syncConfig: Config.sourceSync,
}

@genType
type syncSource = HyperSync(hyperSyncConfig) | HyperFuel(hyperFuelConfig) | Rpc(rpcConfig)

@genType.opaque
type aliasAbi = Ethers.abi

type eventName = string

type contract = {
  name: string,
  abi: aliasAbi,
  addresses: array<string>,
  events: array<eventName>,
}

type configYaml = {
  syncSource,
  startBlock: int,
  confirmedBlockThreshold: int,
  contracts: dict<contract>,
  lowercaseAddresses: bool,
}

let publicConfig = ChainMap.fromArrayUnsafe([
  {
    let contracts = Js.Dict.fromArray([
      (
        "Vault",
        {
          name: "Vault",
          abi: Types.Vault.abi,
          addresses: [
            "0xfcFB38BA4f808c569e815Db89f71D23FaC5bacE3",
          ],
          events: [
            Types.Vault.Deposit.name,
            Types.Vault.Fulfilment.name,
          ],
        }
      ),
    ])
    let chain = ChainMap.Chain.makeUnsafe(~chainId=80002)
    (
      chain,
      {
        confirmedBlockThreshold: 200,
        syncSource: HyperSync({endpointUrl: "https://80002.hypersync.xyz"}),
        startBlock: 35975481,
        contracts,
        lowercaseAddresses: false
      }
    )
  },
  {
    let contracts = Js.Dict.fromArray([
      (
        "Vault",
        {
          name: "Vault",
          abi: Types.Vault.abi,
          addresses: [
            "0xfcFB38BA4f808c569e815Db89f71D23FaC5bacE3",
          ],
          events: [
            Types.Vault.Deposit.name,
            Types.Vault.Fulfilment.name,
          ],
        }
      ),
    ])
    let chain = ChainMap.Chain.makeUnsafe(~chainId=84532)
    (
      chain,
      {
        confirmedBlockThreshold: 200,
        syncSource: HyperSync({endpointUrl: "https://84532.hypersync.xyz"}),
        startBlock: 39655110,
        contracts,
        lowercaseAddresses: false
      }
    )
  },
  {
    let contracts = Js.Dict.fromArray([
      (
        "Vault",
        {
          name: "Vault",
          abi: Types.Vault.abi,
          addresses: [
            "0xfcFB38BA4f808c569e815Db89f71D23FaC5bacE3",
          ],
          events: [
            Types.Vault.Deposit.name,
            Types.Vault.Fulfilment.name,
          ],
        }
      ),
    ])
    let chain = ChainMap.Chain.makeUnsafe(~chainId=421614)
    (
      chain,
      {
        confirmedBlockThreshold: 0,
        syncSource: HyperSync({endpointUrl: "https://421614.hypersync.xyz"}),
        startBlock: 255760289,
        contracts,
        lowercaseAddresses: false
      }
    )
  },
  {
    let contracts = Js.Dict.fromArray([
      (
        "Vault",
        {
          name: "Vault",
          abi: Types.Vault.abi,
          addresses: [
            "0xfcFB38BA4f808c569e815Db89f71D23FaC5bacE3",
          ],
          events: [
            Types.Vault.Deposit.name,
            Types.Vault.Fulfilment.name,
          ],
        }
      ),
    ])
    let chain = ChainMap.Chain.makeUnsafe(~chainId=11155111)
    (
      chain,
      {
        confirmedBlockThreshold: 200,
        syncSource: HyperSync({endpointUrl: "https://11155111.hypersync.xyz"}),
        startBlock: 10570133,
        contracts,
        lowercaseAddresses: false
      }
    )
  },
  {
    let contracts = Js.Dict.fromArray([
      (
        "Vault",
        {
          name: "Vault",
          abi: Types.Vault.abi,
          addresses: [
            "0xfcFB38BA4f808c569e815Db89f71D23FaC5bacE3",
          ],
          events: [
            Types.Vault.Deposit.name,
            Types.Vault.Fulfilment.name,
          ],
        }
      ),
    ])
    let chain = ChainMap.Chain.makeUnsafe(~chainId=11155420)
    (
      chain,
      {
        confirmedBlockThreshold: 0,
        syncSource: HyperSync({endpointUrl: "https://11155420.hypersync.xyz"}),
        startBlock: 41637985,
        contracts,
        lowercaseAddresses: false
      }
    )
  },
])

@genType
let getGeneratedByChainId: int => configYaml = chainId => {
  let chain = ChainMap.Chain.makeUnsafe(~chainId)
  if !(publicConfig->ChainMap.has(chain)) {
    Js.Exn.raiseError(
      "No chain with id " ++ chain->ChainMap.Chain.toString ++ " found in config.yaml",
    )
  }
  publicConfig->ChainMap.get(chain)
}
