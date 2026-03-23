/* TypeScript file generated from Types.res by genType. */

/* eslint-disable */
/* tslint:disable */

import type {HandlerContext as $$handlerContext} from './Types.ts';

import type {HandlerWithOptions as $$fnWithEventConfig} from './bindings/OpaqueTypes.ts';

import type {LoaderContext as $$loaderContext} from './Types.ts';

import type {SingleOrMultiple as $$SingleOrMultiple_t} from './bindings/OpaqueTypes';

import type {VaultEvent_t as Entities_VaultEvent_t} from '../src/db/Entities.gen';

import type {entityHandlerContext as Internal_entityHandlerContext} from 'envio/src/Internal.gen';

import type {eventOptions as Internal_eventOptions} from 'envio/src/Internal.gen';

import type {genericContractRegisterArgs as Internal_genericContractRegisterArgs} from 'envio/src/Internal.gen';

import type {genericContractRegister as Internal_genericContractRegister} from 'envio/src/Internal.gen';

import type {genericEvent as Internal_genericEvent} from 'envio/src/Internal.gen';

import type {genericHandlerArgs as Internal_genericHandlerArgs} from 'envio/src/Internal.gen';

import type {genericHandlerWithLoader as Internal_genericHandlerWithLoader} from 'envio/src/Internal.gen';

import type {genericHandler as Internal_genericHandler} from 'envio/src/Internal.gen';

import type {genericLoaderArgs as Internal_genericLoaderArgs} from 'envio/src/Internal.gen';

import type {genericLoader as Internal_genericLoader} from 'envio/src/Internal.gen';

import type {logger as Envio_logger} from 'envio/src/Envio.gen';

import type {t as Address_t} from 'envio/src/Address.gen';

export type id = string;
export type Id = id;

export type contractRegistrations = { readonly log: Envio_logger; readonly addVault: (_1:Address_t) => void };

export type entityLoaderContext<entity,indexedFieldOperations> = {
  readonly get: (_1:id) => Promise<(undefined | entity)>; 
  readonly getOrThrow: (_1:id, message:(undefined | string)) => Promise<entity>; 
  readonly getWhere: indexedFieldOperations; 
  readonly getOrCreate: (_1:entity) => Promise<entity>; 
  readonly set: (_1:entity) => void; 
  readonly deleteUnsafe: (_1:id) => void
};

export type loaderContext = $$loaderContext;

export type entityHandlerContext<entity> = Internal_entityHandlerContext<entity>;

export type handlerContext = $$handlerContext;

export type vaultEvent = Entities_VaultEvent_t;
export type VaultEvent = vaultEvent;

export type Transaction_t = { readonly hash: string };

export type Block_t = {
  readonly number: number; 
  readonly timestamp: number; 
  readonly hash: string
};

export type AggregatedBlock_t = {
  readonly hash: string; 
  readonly number: number; 
  readonly timestamp: number
};

export type AggregatedTransaction_t = { readonly hash: string };

export type eventLog<params> = Internal_genericEvent<params,Block_t,Transaction_t>;
export type EventLog<params> = eventLog<params>;

export type SingleOrMultiple_t<a> = $$SingleOrMultiple_t<a>;

export type HandlerTypes_args<eventArgs,context> = { readonly event: eventLog<eventArgs>; readonly context: context };

export type HandlerTypes_contractRegisterArgs<eventArgs> = Internal_genericContractRegisterArgs<eventLog<eventArgs>,contractRegistrations>;

export type HandlerTypes_contractRegister<eventArgs> = Internal_genericContractRegister<HandlerTypes_contractRegisterArgs<eventArgs>>;

export type HandlerTypes_loaderArgs<eventArgs> = Internal_genericLoaderArgs<eventLog<eventArgs>,loaderContext>;

export type HandlerTypes_loader<eventArgs,loaderReturn> = Internal_genericLoader<HandlerTypes_loaderArgs<eventArgs>,loaderReturn>;

export type HandlerTypes_handlerArgs<eventArgs,loaderReturn> = Internal_genericHandlerArgs<eventLog<eventArgs>,handlerContext,loaderReturn>;

export type HandlerTypes_handler<eventArgs,loaderReturn> = Internal_genericHandler<HandlerTypes_handlerArgs<eventArgs,loaderReturn>>;

export type HandlerTypes_loaderHandler<eventArgs,loaderReturn,eventFilters> = Internal_genericHandlerWithLoader<HandlerTypes_loader<eventArgs,loaderReturn>,HandlerTypes_handler<eventArgs,loaderReturn>,eventFilters>;

export type HandlerTypes_eventConfig<eventFilters> = Internal_eventOptions<eventFilters>;

export type fnWithEventConfig<fn,eventConfig> = $$fnWithEventConfig<fn,eventConfig>;

export type handlerWithOptions<eventArgs,loaderReturn,eventFilters> = fnWithEventConfig<HandlerTypes_handler<eventArgs,loaderReturn>,HandlerTypes_eventConfig<eventFilters>>;

export type contractRegisterWithOptions<eventArgs,eventFilters> = fnWithEventConfig<HandlerTypes_contractRegister<eventArgs>,HandlerTypes_eventConfig<eventFilters>>;

export type Vault_chainId = 80002 | 84532 | 421614 | 11155111;

export type Vault_Deposit_eventArgs = { readonly requestHash: string; readonly from: Address_t };

export type Vault_Deposit_block = Block_t;

export type Vault_Deposit_transaction = Transaction_t;

export type Vault_Deposit_event = {
  /** The parameters or arguments associated with this event. */
  readonly params: Vault_Deposit_eventArgs; 
  /** The unique identifier of the blockchain network where this event occurred. */
  readonly chainId: Vault_chainId; 
  /** The address of the contract that emitted this event. */
  readonly srcAddress: Address_t; 
  /** The index of this event's log within the block. */
  readonly logIndex: number; 
  /** The transaction that triggered this event. Configurable in `config.yaml` via the `field_selection` option. */
  readonly transaction: Vault_Deposit_transaction; 
  /** The block in which this event was recorded. Configurable in `config.yaml` via the `field_selection` option. */
  readonly block: Vault_Deposit_block
};

export type Vault_Deposit_loaderArgs = Internal_genericLoaderArgs<Vault_Deposit_event,loaderContext>;

export type Vault_Deposit_loader<loaderReturn> = Internal_genericLoader<Vault_Deposit_loaderArgs,loaderReturn>;

export type Vault_Deposit_handlerArgs<loaderReturn> = Internal_genericHandlerArgs<Vault_Deposit_event,handlerContext,loaderReturn>;

export type Vault_Deposit_handler<loaderReturn> = Internal_genericHandler<Vault_Deposit_handlerArgs<loaderReturn>>;

export type Vault_Deposit_contractRegister = Internal_genericContractRegister<Internal_genericContractRegisterArgs<Vault_Deposit_event,contractRegistrations>>;

export type Vault_Deposit_eventFilter = { readonly requestHash?: SingleOrMultiple_t<string> };

export type Vault_Deposit_eventFiltersArgs = { 
/** The unique identifier of the blockchain network where this event occurred. */
readonly chainId: Vault_chainId; 
/** Addresses of the contracts indexing the event. */
readonly addresses: Address_t[] };

export type Vault_Deposit_eventFiltersDefinition = 
    Vault_Deposit_eventFilter
  | Vault_Deposit_eventFilter[];

export type Vault_Deposit_eventFilters = 
    Vault_Deposit_eventFilter
  | Vault_Deposit_eventFilter[]
  | ((_1:Vault_Deposit_eventFiltersArgs) => Vault_Deposit_eventFiltersDefinition);

export type Vault_Fulfilment_eventArgs = {
  readonly requestHash: string; 
  readonly from: Address_t; 
  readonly solver: Address_t
};

export type Vault_Fulfilment_block = Block_t;

export type Vault_Fulfilment_transaction = Transaction_t;

export type Vault_Fulfilment_event = {
  /** The parameters or arguments associated with this event. */
  readonly params: Vault_Fulfilment_eventArgs; 
  /** The unique identifier of the blockchain network where this event occurred. */
  readonly chainId: Vault_chainId; 
  /** The address of the contract that emitted this event. */
  readonly srcAddress: Address_t; 
  /** The index of this event's log within the block. */
  readonly logIndex: number; 
  /** The transaction that triggered this event. Configurable in `config.yaml` via the `field_selection` option. */
  readonly transaction: Vault_Fulfilment_transaction; 
  /** The block in which this event was recorded. Configurable in `config.yaml` via the `field_selection` option. */
  readonly block: Vault_Fulfilment_block
};

export type Vault_Fulfilment_loaderArgs = Internal_genericLoaderArgs<Vault_Fulfilment_event,loaderContext>;

export type Vault_Fulfilment_loader<loaderReturn> = Internal_genericLoader<Vault_Fulfilment_loaderArgs,loaderReturn>;

export type Vault_Fulfilment_handlerArgs<loaderReturn> = Internal_genericHandlerArgs<Vault_Fulfilment_event,handlerContext,loaderReturn>;

export type Vault_Fulfilment_handler<loaderReturn> = Internal_genericHandler<Vault_Fulfilment_handlerArgs<loaderReturn>>;

export type Vault_Fulfilment_contractRegister = Internal_genericContractRegister<Internal_genericContractRegisterArgs<Vault_Fulfilment_event,contractRegistrations>>;

export type Vault_Fulfilment_eventFilter = { readonly requestHash?: SingleOrMultiple_t<string> };

export type Vault_Fulfilment_eventFiltersArgs = { 
/** The unique identifier of the blockchain network where this event occurred. */
readonly chainId: Vault_chainId; 
/** Addresses of the contracts indexing the event. */
readonly addresses: Address_t[] };

export type Vault_Fulfilment_eventFiltersDefinition = 
    Vault_Fulfilment_eventFilter
  | Vault_Fulfilment_eventFilter[];

export type Vault_Fulfilment_eventFilters = 
    Vault_Fulfilment_eventFilter
  | Vault_Fulfilment_eventFilter[]
  | ((_1:Vault_Fulfilment_eventFiltersArgs) => Vault_Fulfilment_eventFiltersDefinition);

export type chainId = number;

export type chain = 80002 | 84532 | 421614 | 11155111;
