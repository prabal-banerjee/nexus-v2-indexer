
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
            "0xAc73E77b4FE9BBAAA35C7147DC3Fd5286929A746",
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa",
            "0xa009A9Fdc0eF474e7A3938a89f80329139291568",
          ],
          events: [
            Types.Vault.Deposit.name,
            Types.Vault.Fulfilment.name,
          ],
        }
      ),
    ])
    let chain = ChainMap.Chain.makeUnsafe(~chainId=1)
    (
      chain,
      {
        confirmedBlockThreshold: 200,
        syncSource: HyperSync({endpointUrl: "https://1.hypersync.xyz"}),
        startBlock: 25122336,
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
            "0x111111eA4f8BdfB5AE22c37ebC3eE17b82072F57",
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa",
            "0xa009A9Fdc0eF474e7A3938a89f80329139291568",
          ],
          events: [
            Types.Vault.Deposit.name,
            Types.Vault.Fulfilment.name,
          ],
        }
      ),
    ])
    let chain = ChainMap.Chain.makeUnsafe(~chainId=10)
    (
      chain,
      {
        confirmedBlockThreshold: 0,
        syncSource: HyperSync({endpointUrl: "https://10.hypersync.xyz"}),
        startBlock: 151755723,
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
            "0x111111eA4f8BdfB5AE22c37ebC3eE17b82072F57",
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa",
            "0xa009A9Fdc0eF474e7A3938a89f80329139291568",
          ],
          events: [
            Types.Vault.Deposit.name,
            Types.Vault.Fulfilment.name,
          ],
        }
      ),
    ])
    let chain = ChainMap.Chain.makeUnsafe(~chainId=56)
    (
      chain,
      {
        confirmedBlockThreshold: 200,
        syncSource: HyperSync({endpointUrl: "https://56.hypersync.xyz"}),
        startBlock: 99012181,
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
            "0x111111eA4f8BdfB5AE22c37ebC3eE17b82072F57",
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa",
            "0xa009A9Fdc0eF474e7A3938a89f80329139291568",
          ],
          events: [
            Types.Vault.Deposit.name,
            Types.Vault.Fulfilment.name,
          ],
        }
      ),
    ])
    let chain = ChainMap.Chain.makeUnsafe(~chainId=137)
    (
      chain,
      {
        confirmedBlockThreshold: 200,
        syncSource: HyperSync({endpointUrl: "https://137.hypersync.xyz"}),
        startBlock: 87068903,
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
            "0xAc73E77b4FE9BBAAA35C7147DC3Fd5286929A746",
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa",
            "0xa009A9Fdc0eF474e7A3938a89f80329139291568",
          ],
          events: [
            Types.Vault.Deposit.name,
            Types.Vault.Fulfilment.name,
          ],
        }
      ),
    ])
    let chain = ChainMap.Chain.makeUnsafe(~chainId=143)
    (
      chain,
      {
        confirmedBlockThreshold: 200,
        syncSource: HyperSync({endpointUrl: "https://143.hypersync.xyz"}),
        startBlock: 75405316,
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
            "0xAc73E77b4FE9BBAAA35C7147DC3Fd5286929A746",
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa",
            "0xa009A9Fdc0eF474e7A3938a89f80329139291568",
          ],
          events: [
            Types.Vault.Deposit.name,
            Types.Vault.Fulfilment.name,
          ],
        }
      ),
    ])
    let chain = ChainMap.Chain.makeUnsafe(~chainId=999)
    (
      chain,
      {
        confirmedBlockThreshold: 200,
        syncSource: HyperSync({endpointUrl: "https://999.hypersync.xyz"}),
        startBlock: 35436098,
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
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa",
            "0xa009A9Fdc0eF474e7A3938a89f80329139291568",
          ],
          events: [
            Types.Vault.Deposit.name,
            Types.Vault.Fulfilment.name,
          ],
        }
      ),
    ])
    let chain = ChainMap.Chain.makeUnsafe(~chainId=4114)
    (
      chain,
      {
        confirmedBlockThreshold: 200,
        syncSource: HyperSync({endpointUrl: "https://citrea.hypersync.xyz"}),
        startBlock: 8583100,
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
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa",
            "0xa009A9Fdc0eF474e7A3938a89f80329139291568",
          ],
          events: [
            Types.Vault.Deposit.name,
            Types.Vault.Fulfilment.name,
          ],
        }
      ),
    ])
    let chain = ChainMap.Chain.makeUnsafe(~chainId=4326)
    (
      chain,
      {
        confirmedBlockThreshold: 200,
        syncSource: HyperSync({endpointUrl: "https://megaeth.hypersync.xyz"}),
        startBlock: 18471469,
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
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa",
          ],
          events: [
            Types.Vault.Deposit.name,
            Types.Vault.Fulfilment.name,
          ],
        }
      ),
    ])
    let chain = ChainMap.Chain.makeUnsafe(~chainId=5115)
    (
      chain,
      {
        confirmedBlockThreshold: 0,
        syncSource: HyperSync({endpointUrl: "https://5115.hypersync.xyz"}),
        startBlock: 25735441,
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
            "0x111111eA4f8BdfB5AE22c37ebC3eE17b82072F57",
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa",
            "0xa009A9Fdc0eF474e7A3938a89f80329139291568",
          ],
          events: [
            Types.Vault.Deposit.name,
            Types.Vault.Fulfilment.name,
          ],
        }
      ),
    ])
    let chain = ChainMap.Chain.makeUnsafe(~chainId=8453)
    (
      chain,
      {
        confirmedBlockThreshold: 200,
        syncSource: HyperSync({endpointUrl: "https://8453.hypersync.xyz"}),
        startBlock: 46160439,
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
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa",
          ],
          events: [
            Types.Vault.Deposit.name,
            Types.Vault.Fulfilment.name,
          ],
        }
      ),
    ])
    let chain = ChainMap.Chain.makeUnsafe(~chainId=10143)
    (
      chain,
      {
        confirmedBlockThreshold: 200,
        syncSource: HyperSync({endpointUrl: "https://10143.hypersync.xyz"}),
        startBlock: 30538378,
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
            "0x111111eA4f8BdfB5AE22c37ebC3eE17b82072F57",
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa",
            "0xa009A9Fdc0eF474e7A3938a89f80329139291568",
          ],
          events: [
            Types.Vault.Deposit.name,
            Types.Vault.Fulfilment.name,
          ],
        }
      ),
    ])
    let chain = ChainMap.Chain.makeUnsafe(~chainId=42161)
    (
      chain,
      {
        confirmedBlockThreshold: 0,
        syncSource: HyperSync({endpointUrl: "https://42161.hypersync.xyz"}),
        startBlock: 464126370,
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
            "0xAc73E77b4FE9BBAAA35C7147DC3Fd5286929A746",
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa",
            "0xa009A9Fdc0eF474e7A3938a89f80329139291568",
          ],
          events: [
            Types.Vault.Deposit.name,
            Types.Vault.Fulfilment.name,
          ],
        }
      ),
    ])
    let chain = ChainMap.Chain.makeUnsafe(~chainId=43114)
    (
      chain,
      {
        confirmedBlockThreshold: 200,
        syncSource: HyperSync({endpointUrl: "https://43114.hypersync.xyz"}),
        startBlock: 85752042,
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
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa",
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
        startBlock: 36186485,
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
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa",
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
        startBlock: 39860000,
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
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa",
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
        startBlock: 257100000,
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
            "0x111111eA4f8BdfB5AE22c37ebC3eE17b82072F57",
            "0x9d72Bd22A68001b44c2248Db33505693b1338829",
            "0xa009A9Fdc0eF474e7A3938a89f80329139291568",
          ],
          events: [
            Types.Vault.Deposit.name,
            Types.Vault.Fulfilment.name,
          ],
        }
      ),
    ])
    let chain = ChainMap.Chain.makeUnsafe(~chainId=534352)
    (
      chain,
      {
        confirmedBlockThreshold: 200,
        syncSource: HyperSync({endpointUrl: "https://534352.hypersync.xyz"}),
        startBlock: 33745772,
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
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa",
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
        startBlock: 10604152,
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
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa",
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
        startBlock: 41673742,
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
