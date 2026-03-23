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
            "0x56a1646ec5ecaf69875e64400bbf251a38e24fbd"->Address.Evm.fromStringOrThrow
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
        startBlock: 35576940,
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
            "0x56a1646ec5ecaf69875e64400bbf251a38e24fbd"->Address.Evm.fromStringOrThrow
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
        startBlock: 39256570,
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
            "0x56a1646ec5ecaf69875e64400bbf251a38e24fbd"->Address.Evm.fromStringOrThrow
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
        startBlock: 252903520,
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
            "0x56a1646ec5ecaf69875e64400bbf251a38e24fbd"->Address.Evm.fromStringOrThrow
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
        startBlock: 10505330,
        id: 11155111,
        contracts,
        sources: NetworkSources.evm(~chain, ~contracts=[{name: "Vault",events: [Types.Vault.Deposit.register(), Types.Vault.Fulfilment.register()],abi: Types.Vault.abi}], ~hyperSync=Some("https://11155111.hypersync.xyz"), ~allEventSignatures=[Types.Vault.eventSignatures]->Belt.Array.concatMany, ~shouldUseHypersyncClientDecoder=true, ~rpcs=[], ~lowercaseAddresses=false)
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
