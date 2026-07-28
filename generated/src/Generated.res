@val external require: string => unit = "require"

let registerContractHandlers = (
  ~contractName,
  ~handlerPathRelativeToRoot,
  ~handlerPathRelativeToConfig,
) => {
  try {
    require(`../${Path.relativePathToRootFromGenerated}/${handlerPathRelativeToRoot}`)
  } catch {
  | exn =>
    let params = {
      "Contract Name": contractName,
      "Expected Handler Path": handlerPathRelativeToConfig,
      "Code": "EE500",
    }
    let logger = Logging.createChild(~params)

    let errHandler = exn->ErrorHandling.make(~msg="Failed to import handler file", ~logger)
    errHandler->ErrorHandling.log
    errHandler->ErrorHandling.raiseExn
  }
}

let makeGeneratedConfig = () => {
  let chains = [
    {
      let contracts = [
        {
          Config.name: "Vault",
          abi: Types.Vault.abi,
          addresses: [
            "0xAc73E77b4FE9BBAAA35C7147DC3Fd5286929A746"->Address.Evm.fromStringOrThrow
,
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa"->Address.Evm.fromStringOrThrow
,
            "0xa009A9Fdc0eF474e7A3938a89f80329139291568"->Address.Evm.fromStringOrThrow
,
          ],
          events: [
            (Types.Vault.Deposit.register() :> Internal.eventConfig),
            (Types.Vault.Fulfilment.register() :> Internal.eventConfig),
          ],
          startBlock: None,
        },
      ]
      let chain = ChainMap.Chain.makeUnsafe(~chainId=1)
      {
        Config.maxReorgDepth: 200,
        startBlock: 25122336,
        id: 1,
        contracts,
        sources: NetworkSources.evm(~chain, ~contracts=[{name: "Vault",events: [Types.Vault.Deposit.register(), Types.Vault.Fulfilment.register()],abi: Types.Vault.abi}], ~hyperSync=Some("https://1.hypersync.xyz"), ~allEventSignatures=[Types.Vault.eventSignatures]->Belt.Array.concatMany, ~shouldUseHypersyncClientDecoder=true, ~rpcs=[], ~lowercaseAddresses=false)
      }
    },
    {
      let contracts = [
        {
          Config.name: "Vault",
          abi: Types.Vault.abi,
          addresses: [
            "0x111111eA4f8BdfB5AE22c37ebC3eE17b82072F57"->Address.Evm.fromStringOrThrow
,
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa"->Address.Evm.fromStringOrThrow
,
            "0xa009A9Fdc0eF474e7A3938a89f80329139291568"->Address.Evm.fromStringOrThrow
,
          ],
          events: [
            (Types.Vault.Deposit.register() :> Internal.eventConfig),
            (Types.Vault.Fulfilment.register() :> Internal.eventConfig),
          ],
          startBlock: None,
        },
      ]
      let chain = ChainMap.Chain.makeUnsafe(~chainId=10)
      {
        Config.maxReorgDepth: 0,
        startBlock: 151755723,
        id: 10,
        contracts,
        sources: NetworkSources.evm(~chain, ~contracts=[{name: "Vault",events: [Types.Vault.Deposit.register(), Types.Vault.Fulfilment.register()],abi: Types.Vault.abi}], ~hyperSync=Some("https://10.hypersync.xyz"), ~allEventSignatures=[Types.Vault.eventSignatures]->Belt.Array.concatMany, ~shouldUseHypersyncClientDecoder=true, ~rpcs=[], ~lowercaseAddresses=false)
      }
    },
    {
      let contracts = [
        {
          Config.name: "Vault",
          abi: Types.Vault.abi,
          addresses: [
            "0x111111eA4f8BdfB5AE22c37ebC3eE17b82072F57"->Address.Evm.fromStringOrThrow
,
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa"->Address.Evm.fromStringOrThrow
,
            "0xa009A9Fdc0eF474e7A3938a89f80329139291568"->Address.Evm.fromStringOrThrow
,
          ],
          events: [
            (Types.Vault.Deposit.register() :> Internal.eventConfig),
            (Types.Vault.Fulfilment.register() :> Internal.eventConfig),
          ],
          startBlock: None,
        },
      ]
      let chain = ChainMap.Chain.makeUnsafe(~chainId=56)
      {
        Config.maxReorgDepth: 200,
        startBlock: 99012181,
        id: 56,
        contracts,
        sources: NetworkSources.evm(~chain, ~contracts=[{name: "Vault",events: [Types.Vault.Deposit.register(), Types.Vault.Fulfilment.register()],abi: Types.Vault.abi}], ~hyperSync=Some("https://56.hypersync.xyz"), ~allEventSignatures=[Types.Vault.eventSignatures]->Belt.Array.concatMany, ~shouldUseHypersyncClientDecoder=true, ~rpcs=[], ~lowercaseAddresses=false)
      }
    },
    {
      let contracts = [
        {
          Config.name: "Vault",
          abi: Types.Vault.abi,
          addresses: [
            "0x111111eA4f8BdfB5AE22c37ebC3eE17b82072F57"->Address.Evm.fromStringOrThrow
,
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa"->Address.Evm.fromStringOrThrow
,
            "0xa009A9Fdc0eF474e7A3938a89f80329139291568"->Address.Evm.fromStringOrThrow
,
          ],
          events: [
            (Types.Vault.Deposit.register() :> Internal.eventConfig),
            (Types.Vault.Fulfilment.register() :> Internal.eventConfig),
          ],
          startBlock: None,
        },
      ]
      let chain = ChainMap.Chain.makeUnsafe(~chainId=137)
      {
        Config.maxReorgDepth: 200,
        startBlock: 87068903,
        id: 137,
        contracts,
        sources: NetworkSources.evm(~chain, ~contracts=[{name: "Vault",events: [Types.Vault.Deposit.register(), Types.Vault.Fulfilment.register()],abi: Types.Vault.abi}], ~hyperSync=Some("https://137.hypersync.xyz"), ~allEventSignatures=[Types.Vault.eventSignatures]->Belt.Array.concatMany, ~shouldUseHypersyncClientDecoder=true, ~rpcs=[], ~lowercaseAddresses=false)
      }
    },
    {
      let contracts = [
        {
          Config.name: "Vault",
          abi: Types.Vault.abi,
          addresses: [
            "0xAc73E77b4FE9BBAAA35C7147DC3Fd5286929A746"->Address.Evm.fromStringOrThrow
,
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa"->Address.Evm.fromStringOrThrow
,
            "0xa009A9Fdc0eF474e7A3938a89f80329139291568"->Address.Evm.fromStringOrThrow
,
          ],
          events: [
            (Types.Vault.Deposit.register() :> Internal.eventConfig),
            (Types.Vault.Fulfilment.register() :> Internal.eventConfig),
          ],
          startBlock: None,
        },
      ]
      let chain = ChainMap.Chain.makeUnsafe(~chainId=143)
      {
        Config.maxReorgDepth: 200,
        startBlock: 75405316,
        id: 143,
        contracts,
        sources: NetworkSources.evm(~chain, ~contracts=[{name: "Vault",events: [Types.Vault.Deposit.register(), Types.Vault.Fulfilment.register()],abi: Types.Vault.abi}], ~hyperSync=Some("https://143.hypersync.xyz"), ~allEventSignatures=[Types.Vault.eventSignatures]->Belt.Array.concatMany, ~shouldUseHypersyncClientDecoder=true, ~rpcs=[], ~lowercaseAddresses=false)
      }
    },
    {
      let contracts = [
        {
          Config.name: "Vault",
          abi: Types.Vault.abi,
          addresses: [
            "0xAc73E77b4FE9BBAAA35C7147DC3Fd5286929A746"->Address.Evm.fromStringOrThrow
,
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa"->Address.Evm.fromStringOrThrow
,
            "0xa009A9Fdc0eF474e7A3938a89f80329139291568"->Address.Evm.fromStringOrThrow
,
          ],
          events: [
            (Types.Vault.Deposit.register() :> Internal.eventConfig),
            (Types.Vault.Fulfilment.register() :> Internal.eventConfig),
          ],
          startBlock: None,
        },
      ]
      let chain = ChainMap.Chain.makeUnsafe(~chainId=999)
      {
        Config.maxReorgDepth: 200,
        startBlock: 35436098,
        id: 999,
        contracts,
        sources: NetworkSources.evm(~chain, ~contracts=[{name: "Vault",events: [Types.Vault.Deposit.register(), Types.Vault.Fulfilment.register()],abi: Types.Vault.abi}], ~hyperSync=Some("https://999.hypersync.xyz"), ~allEventSignatures=[Types.Vault.eventSignatures]->Belt.Array.concatMany, ~shouldUseHypersyncClientDecoder=true, ~rpcs=[], ~lowercaseAddresses=false)
      }
    },
    {
      let contracts = [
        {
          Config.name: "Vault",
          abi: Types.Vault.abi,
          addresses: [
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa"->Address.Evm.fromStringOrThrow
,
            "0xa009A9Fdc0eF474e7A3938a89f80329139291568"->Address.Evm.fromStringOrThrow
,
          ],
          events: [
            (Types.Vault.Deposit.register() :> Internal.eventConfig),
            (Types.Vault.Fulfilment.register() :> Internal.eventConfig),
          ],
          startBlock: None,
        },
      ]
      let chain = ChainMap.Chain.makeUnsafe(~chainId=4114)
      {
        Config.maxReorgDepth: 200,
        startBlock: 8583100,
        id: 4114,
        contracts,
        sources: NetworkSources.evm(~chain, ~contracts=[{name: "Vault",events: [Types.Vault.Deposit.register(), Types.Vault.Fulfilment.register()],abi: Types.Vault.abi}], ~hyperSync=Some("https://citrea.hypersync.xyz"), ~allEventSignatures=[Types.Vault.eventSignatures]->Belt.Array.concatMany, ~shouldUseHypersyncClientDecoder=true, ~rpcs=[], ~lowercaseAddresses=false)
      }
    },
    {
      let contracts = [
        {
          Config.name: "Vault",
          abi: Types.Vault.abi,
          addresses: [
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa"->Address.Evm.fromStringOrThrow
,
            "0xa009A9Fdc0eF474e7A3938a89f80329139291568"->Address.Evm.fromStringOrThrow
,
          ],
          events: [
            (Types.Vault.Deposit.register() :> Internal.eventConfig),
            (Types.Vault.Fulfilment.register() :> Internal.eventConfig),
          ],
          startBlock: None,
        },
      ]
      let chain = ChainMap.Chain.makeUnsafe(~chainId=4326)
      {
        Config.maxReorgDepth: 200,
        startBlock: 18471469,
        id: 4326,
        contracts,
        sources: NetworkSources.evm(~chain, ~contracts=[{name: "Vault",events: [Types.Vault.Deposit.register(), Types.Vault.Fulfilment.register()],abi: Types.Vault.abi}], ~hyperSync=Some("https://megaeth.hypersync.xyz"), ~allEventSignatures=[Types.Vault.eventSignatures]->Belt.Array.concatMany, ~shouldUseHypersyncClientDecoder=true, ~rpcs=[], ~lowercaseAddresses=false)
      }
    },
    {
      let contracts = [
        {
          Config.name: "Vault",
          abi: Types.Vault.abi,
          addresses: [
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa"->Address.Evm.fromStringOrThrow
,
          ],
          events: [
            (Types.Vault.Deposit.register() :> Internal.eventConfig),
            (Types.Vault.Fulfilment.register() :> Internal.eventConfig),
          ],
          startBlock: None,
        },
      ]
      let chain = ChainMap.Chain.makeUnsafe(~chainId=5115)
      {
        Config.maxReorgDepth: 0,
        startBlock: 25735441,
        id: 5115,
        contracts,
        sources: NetworkSources.evm(~chain, ~contracts=[{name: "Vault",events: [Types.Vault.Deposit.register(), Types.Vault.Fulfilment.register()],abi: Types.Vault.abi}], ~hyperSync=Some("https://5115.hypersync.xyz"), ~allEventSignatures=[Types.Vault.eventSignatures]->Belt.Array.concatMany, ~shouldUseHypersyncClientDecoder=true, ~rpcs=[], ~lowercaseAddresses=false)
      }
    },
    {
      let contracts = [
        {
          Config.name: "Vault",
          abi: Types.Vault.abi,
          addresses: [
            "0x111111eA4f8BdfB5AE22c37ebC3eE17b82072F57"->Address.Evm.fromStringOrThrow
,
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa"->Address.Evm.fromStringOrThrow
,
            "0xa009A9Fdc0eF474e7A3938a89f80329139291568"->Address.Evm.fromStringOrThrow
,
          ],
          events: [
            (Types.Vault.Deposit.register() :> Internal.eventConfig),
            (Types.Vault.Fulfilment.register() :> Internal.eventConfig),
          ],
          startBlock: None,
        },
      ]
      let chain = ChainMap.Chain.makeUnsafe(~chainId=8453)
      {
        Config.maxReorgDepth: 200,
        startBlock: 46160439,
        id: 8453,
        contracts,
        sources: NetworkSources.evm(~chain, ~contracts=[{name: "Vault",events: [Types.Vault.Deposit.register(), Types.Vault.Fulfilment.register()],abi: Types.Vault.abi}], ~hyperSync=Some("https://8453.hypersync.xyz"), ~allEventSignatures=[Types.Vault.eventSignatures]->Belt.Array.concatMany, ~shouldUseHypersyncClientDecoder=true, ~rpcs=[], ~lowercaseAddresses=false)
      }
    },
    {
      let contracts = [
        {
          Config.name: "Vault",
          abi: Types.Vault.abi,
          addresses: [
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa"->Address.Evm.fromStringOrThrow
,
          ],
          events: [
            (Types.Vault.Deposit.register() :> Internal.eventConfig),
            (Types.Vault.Fulfilment.register() :> Internal.eventConfig),
          ],
          startBlock: None,
        },
      ]
      let chain = ChainMap.Chain.makeUnsafe(~chainId=10143)
      {
        Config.maxReorgDepth: 200,
        startBlock: 30538378,
        id: 10143,
        contracts,
        sources: NetworkSources.evm(~chain, ~contracts=[{name: "Vault",events: [Types.Vault.Deposit.register(), Types.Vault.Fulfilment.register()],abi: Types.Vault.abi}], ~hyperSync=Some("https://10143.hypersync.xyz"), ~allEventSignatures=[Types.Vault.eventSignatures]->Belt.Array.concatMany, ~shouldUseHypersyncClientDecoder=true, ~rpcs=[], ~lowercaseAddresses=false)
      }
    },
    {
      let contracts = [
        {
          Config.name: "Vault",
          abi: Types.Vault.abi,
          addresses: [
            "0x111111eA4f8BdfB5AE22c37ebC3eE17b82072F57"->Address.Evm.fromStringOrThrow
,
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa"->Address.Evm.fromStringOrThrow
,
            "0xa009A9Fdc0eF474e7A3938a89f80329139291568"->Address.Evm.fromStringOrThrow
,
          ],
          events: [
            (Types.Vault.Deposit.register() :> Internal.eventConfig),
            (Types.Vault.Fulfilment.register() :> Internal.eventConfig),
          ],
          startBlock: None,
        },
      ]
      let chain = ChainMap.Chain.makeUnsafe(~chainId=42161)
      {
        Config.maxReorgDepth: 0,
        startBlock: 464126370,
        id: 42161,
        contracts,
        sources: NetworkSources.evm(~chain, ~contracts=[{name: "Vault",events: [Types.Vault.Deposit.register(), Types.Vault.Fulfilment.register()],abi: Types.Vault.abi}], ~hyperSync=Some("https://42161.hypersync.xyz"), ~allEventSignatures=[Types.Vault.eventSignatures]->Belt.Array.concatMany, ~shouldUseHypersyncClientDecoder=true, ~rpcs=[], ~lowercaseAddresses=false)
      }
    },
    {
      let contracts = [
        {
          Config.name: "Vault",
          abi: Types.Vault.abi,
          addresses: [
            "0xAc73E77b4FE9BBAAA35C7147DC3Fd5286929A746"->Address.Evm.fromStringOrThrow
,
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa"->Address.Evm.fromStringOrThrow
,
            "0xa009A9Fdc0eF474e7A3938a89f80329139291568"->Address.Evm.fromStringOrThrow
,
          ],
          events: [
            (Types.Vault.Deposit.register() :> Internal.eventConfig),
            (Types.Vault.Fulfilment.register() :> Internal.eventConfig),
          ],
          startBlock: None,
        },
      ]
      let chain = ChainMap.Chain.makeUnsafe(~chainId=43114)
      {
        Config.maxReorgDepth: 200,
        startBlock: 85752042,
        id: 43114,
        contracts,
        sources: NetworkSources.evm(~chain, ~contracts=[{name: "Vault",events: [Types.Vault.Deposit.register(), Types.Vault.Fulfilment.register()],abi: Types.Vault.abi}], ~hyperSync=Some("https://43114.hypersync.xyz"), ~allEventSignatures=[Types.Vault.eventSignatures]->Belt.Array.concatMany, ~shouldUseHypersyncClientDecoder=true, ~rpcs=[], ~lowercaseAddresses=false)
      }
    },
    {
      let contracts = [
        {
          Config.name: "Vault",
          abi: Types.Vault.abi,
          addresses: [
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa"->Address.Evm.fromStringOrThrow
,
          ],
          events: [
            (Types.Vault.Deposit.register() :> Internal.eventConfig),
            (Types.Vault.Fulfilment.register() :> Internal.eventConfig),
          ],
          startBlock: None,
        },
      ]
      let chain = ChainMap.Chain.makeUnsafe(~chainId=80002)
      {
        Config.maxReorgDepth: 200,
        startBlock: 36186485,
        id: 80002,
        contracts,
        sources: NetworkSources.evm(~chain, ~contracts=[{name: "Vault",events: [Types.Vault.Deposit.register(), Types.Vault.Fulfilment.register()],abi: Types.Vault.abi}], ~hyperSync=Some("https://80002.hypersync.xyz"), ~allEventSignatures=[Types.Vault.eventSignatures]->Belt.Array.concatMany, ~shouldUseHypersyncClientDecoder=true, ~rpcs=[], ~lowercaseAddresses=false)
      }
    },
    {
      let contracts = [
        {
          Config.name: "Vault",
          abi: Types.Vault.abi,
          addresses: [
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa"->Address.Evm.fromStringOrThrow
,
          ],
          events: [
            (Types.Vault.Deposit.register() :> Internal.eventConfig),
            (Types.Vault.Fulfilment.register() :> Internal.eventConfig),
          ],
          startBlock: None,
        },
      ]
      let chain = ChainMap.Chain.makeUnsafe(~chainId=84532)
      {
        Config.maxReorgDepth: 200,
        startBlock: 39860000,
        id: 84532,
        contracts,
        sources: NetworkSources.evm(~chain, ~contracts=[{name: "Vault",events: [Types.Vault.Deposit.register(), Types.Vault.Fulfilment.register()],abi: Types.Vault.abi}], ~hyperSync=Some("https://84532.hypersync.xyz"), ~allEventSignatures=[Types.Vault.eventSignatures]->Belt.Array.concatMany, ~shouldUseHypersyncClientDecoder=true, ~rpcs=[], ~lowercaseAddresses=false)
      }
    },
    {
      let contracts = [
        {
          Config.name: "Vault",
          abi: Types.Vault.abi,
          addresses: [
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa"->Address.Evm.fromStringOrThrow
,
          ],
          events: [
            (Types.Vault.Deposit.register() :> Internal.eventConfig),
            (Types.Vault.Fulfilment.register() :> Internal.eventConfig),
          ],
          startBlock: None,
        },
      ]
      let chain = ChainMap.Chain.makeUnsafe(~chainId=421614)
      {
        Config.maxReorgDepth: 0,
        startBlock: 257100000,
        id: 421614,
        contracts,
        sources: NetworkSources.evm(~chain, ~contracts=[{name: "Vault",events: [Types.Vault.Deposit.register(), Types.Vault.Fulfilment.register()],abi: Types.Vault.abi}], ~hyperSync=Some("https://421614.hypersync.xyz"), ~allEventSignatures=[Types.Vault.eventSignatures]->Belt.Array.concatMany, ~shouldUseHypersyncClientDecoder=true, ~rpcs=[], ~lowercaseAddresses=false)
      }
    },
    {
      let contracts = [
        {
          Config.name: "Vault",
          abi: Types.Vault.abi,
          addresses: [
            "0x111111eA4f8BdfB5AE22c37ebC3eE17b82072F57"->Address.Evm.fromStringOrThrow
,
            "0x9d72Bd22A68001b44c2248Db33505693b1338829"->Address.Evm.fromStringOrThrow
,
            "0xa009A9Fdc0eF474e7A3938a89f80329139291568"->Address.Evm.fromStringOrThrow
,
          ],
          events: [
            (Types.Vault.Deposit.register() :> Internal.eventConfig),
            (Types.Vault.Fulfilment.register() :> Internal.eventConfig),
          ],
          startBlock: None,
        },
      ]
      let chain = ChainMap.Chain.makeUnsafe(~chainId=534352)
      {
        Config.maxReorgDepth: 200,
        startBlock: 33745772,
        id: 534352,
        contracts,
        sources: NetworkSources.evm(~chain, ~contracts=[{name: "Vault",events: [Types.Vault.Deposit.register(), Types.Vault.Fulfilment.register()],abi: Types.Vault.abi}], ~hyperSync=Some("https://534352.hypersync.xyz"), ~allEventSignatures=[Types.Vault.eventSignatures]->Belt.Array.concatMany, ~shouldUseHypersyncClientDecoder=true, ~rpcs=[], ~lowercaseAddresses=false)
      }
    },
    {
      let contracts = [
        {
          Config.name: "Vault",
          abi: Types.Vault.abi,
          addresses: [
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa"->Address.Evm.fromStringOrThrow
,
          ],
          events: [
            (Types.Vault.Deposit.register() :> Internal.eventConfig),
            (Types.Vault.Fulfilment.register() :> Internal.eventConfig),
          ],
          startBlock: None,
        },
      ]
      let chain = ChainMap.Chain.makeUnsafe(~chainId=11155111)
      {
        Config.maxReorgDepth: 200,
        startBlock: 10604152,
        id: 11155111,
        contracts,
        sources: NetworkSources.evm(~chain, ~contracts=[{name: "Vault",events: [Types.Vault.Deposit.register(), Types.Vault.Fulfilment.register()],abi: Types.Vault.abi}], ~hyperSync=Some("https://11155111.hypersync.xyz"), ~allEventSignatures=[Types.Vault.eventSignatures]->Belt.Array.concatMany, ~shouldUseHypersyncClientDecoder=true, ~rpcs=[], ~lowercaseAddresses=false)
      }
    },
    {
      let contracts = [
        {
          Config.name: "Vault",
          abi: Types.Vault.abi,
          addresses: [
            "0x86B60E813f9b739516dDbDc443526be5Ef8336aa"->Address.Evm.fromStringOrThrow
,
          ],
          events: [
            (Types.Vault.Deposit.register() :> Internal.eventConfig),
            (Types.Vault.Fulfilment.register() :> Internal.eventConfig),
          ],
          startBlock: None,
        },
      ]
      let chain = ChainMap.Chain.makeUnsafe(~chainId=11155420)
      {
        Config.maxReorgDepth: 0,
        startBlock: 41673742,
        id: 11155420,
        contracts,
        sources: NetworkSources.evm(~chain, ~contracts=[{name: "Vault",events: [Types.Vault.Deposit.register(), Types.Vault.Fulfilment.register()],abi: Types.Vault.abi}], ~hyperSync=Some("https://11155420.hypersync.xyz"), ~allEventSignatures=[Types.Vault.eventSignatures]->Belt.Array.concatMany, ~shouldUseHypersyncClientDecoder=true, ~rpcs=[], ~lowercaseAddresses=false)
      }
    },
  ]

  Config.make(
    ~shouldRollbackOnReorg=true,
    ~shouldSaveFullHistory=false,
    ~multichain=if (
      Env.Configurable.isUnorderedMultichainMode->Belt.Option.getWithDefault(
        Env.Configurable.unstable__temp_unordered_head_mode->Belt.Option.getWithDefault(
          true,
        ),
      )
    ) {
      Unordered
    } else {
      Ordered
    },
    ~chains,
    ~enableRawEvents=false,
    ~batchSize=?Env.batchSize,
    ~preloadHandlers=false,
    ~lowercaseAddresses=false,
    ~shouldUseHypersyncClientDecoder=true,
  )
}

let configWithoutRegistrations = makeGeneratedConfig()

let registerAllHandlers = () => {
  EventRegister.startRegistration(
    ~ecosystem=configWithoutRegistrations.ecosystem,
    ~multichain=configWithoutRegistrations.multichain,
    ~preloadHandlers=configWithoutRegistrations.preloadHandlers,
  )

  registerContractHandlers(
    ~contractName="Vault",
    ~handlerPathRelativeToRoot="src/EventHandlers.ts",
    ~handlerPathRelativeToConfig="src/EventHandlers.ts",
  )

  EventRegister.finishRegistration()
}

let initialSql = Db.makeClient()
let storagePgSchema = Env.Db.publicSchema
let makeStorage = (~sql, ~pgSchema=storagePgSchema, ~isHasuraEnabled=Env.Hasura.enabled) => {
  PgStorage.make(
    ~sql,
    ~pgSchema,
    ~pgHost=Env.Db.host,
    ~pgUser=Env.Db.user,
    ~pgPort=Env.Db.port,
    ~pgDatabase=Env.Db.database,
    ~pgPassword=Env.Db.password,
    ~onInitialize=?{
      if isHasuraEnabled {
        Some(
          () => {
            Hasura.trackDatabase(
              ~endpoint=Env.Hasura.graphqlEndpoint,
              ~auth={
                role: Env.Hasura.role,
                secret: Env.Hasura.secret,
              },
              ~pgSchema=storagePgSchema,
              ~userEntities=Entities.userEntities,
              ~responseLimit=Env.Hasura.responseLimit,
              ~schema=Db.schema,
              ~aggregateEntities=Env.Hasura.aggregateEntities,
            )->Promise.catch(err => {
              Logging.errorWithExn(
                err->Utils.prettifyExn,
                `EE803: Error tracking tables`,
              )->Promise.resolve
            })
          },
        )
      } else {
        None
      }
    },
    ~onNewTables=?{
      if isHasuraEnabled {
        Some(
          (~tableNames) => {
            Hasura.trackTables(
              ~endpoint=Env.Hasura.graphqlEndpoint,
              ~auth={
                role: Env.Hasura.role,
                secret: Env.Hasura.secret,
              },
              ~pgSchema=storagePgSchema,
              ~tableNames,
            )->Promise.catch(err => {
              Logging.errorWithExn(
                err->Utils.prettifyExn,
                `EE804: Error tracking new tables`,
              )->Promise.resolve
            })
          },
        )
      } else {
        None
      }
    },
    ~isHasuraEnabled,
  )
}

let codegenPersistence = Persistence.make(
  ~userEntities=Entities.userEntities,
  ~allEnums=Enums.allEnums,
  ~storage=makeStorage(~sql=initialSql),
  ~sql=initialSql,
)

%%private(let indexer: ref<option<Indexer.t>> = ref(None))
let getIndexer = () => {
  switch indexer.contents {
  | Some(indexer) => indexer
  | None =>
    let i = {
      Indexer.registrations: registerAllHandlers(),
      // Need to recreate initial config one more time,
      // since configWithoutRegistrations called register for event
      // before they were ready
      config: makeGeneratedConfig(),
      persistence: codegenPersistence,
    }
    indexer := Some(i)
    i
  }
}
