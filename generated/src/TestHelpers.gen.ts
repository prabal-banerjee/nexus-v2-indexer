/* TypeScript file generated from TestHelpers.res by genType. */

/* eslint-disable */
/* tslint:disable */

const TestHelpersJS = require('./TestHelpers.res.js');

import type {Vault_Deposit_event as Types_Vault_Deposit_event} from './Types.gen';

import type {Vault_Fulfilment_event as Types_Vault_Fulfilment_event} from './Types.gen';

import type {t as Address_t} from 'envio/src/Address.gen';

import type {t as TestHelpers_MockDb_t} from './TestHelpers_MockDb.gen';

/** The arguements that get passed to a "processEvent" helper function */
export type EventFunctions_eventProcessorArgs<event> = {
  readonly event: event; 
  readonly mockDb: TestHelpers_MockDb_t; 
  readonly chainId?: number
};

export type EventFunctions_eventProcessor<event> = (_1:EventFunctions_eventProcessorArgs<event>) => Promise<TestHelpers_MockDb_t>;

export type EventFunctions_MockBlock_t = {
  readonly hash?: string; 
  readonly number?: number; 
  readonly timestamp?: number
};

export type EventFunctions_MockTransaction_t = {};

export type EventFunctions_mockEventData = {
  readonly chainId?: number; 
  readonly srcAddress?: Address_t; 
  readonly logIndex?: number; 
  readonly block?: EventFunctions_MockBlock_t; 
  readonly transaction?: EventFunctions_MockTransaction_t
};

export type Vault_Deposit_createMockArgs = {
  readonly requestHash?: string; 
  readonly from?: Address_t; 
  readonly mockEventData?: EventFunctions_mockEventData
};

export type Vault_Fulfilment_createMockArgs = {
  readonly requestHash?: string; 
  readonly from?: Address_t; 
  readonly solver?: Address_t; 
  readonly mockEventData?: EventFunctions_mockEventData
};

export const MockDb_createMockDb: () => TestHelpers_MockDb_t = TestHelpersJS.MockDb.createMockDb as any;

export const Addresses_mockAddresses: Address_t[] = TestHelpersJS.Addresses.mockAddresses as any;

export const Addresses_defaultAddress: Address_t = TestHelpersJS.Addresses.defaultAddress as any;

export const Vault_Deposit_processEvent: EventFunctions_eventProcessor<Types_Vault_Deposit_event> = TestHelpersJS.Vault.Deposit.processEvent as any;

export const Vault_Deposit_createMockEvent: (args:Vault_Deposit_createMockArgs) => Types_Vault_Deposit_event = TestHelpersJS.Vault.Deposit.createMockEvent as any;

export const Vault_Fulfilment_processEvent: EventFunctions_eventProcessor<Types_Vault_Fulfilment_event> = TestHelpersJS.Vault.Fulfilment.processEvent as any;

export const Vault_Fulfilment_createMockEvent: (args:Vault_Fulfilment_createMockArgs) => Types_Vault_Fulfilment_event = TestHelpersJS.Vault.Fulfilment.createMockEvent as any;

export const Addresses: { mockAddresses: Address_t[]; defaultAddress: Address_t } = TestHelpersJS.Addresses as any;

export const Vault: { Deposit: { processEvent: EventFunctions_eventProcessor<Types_Vault_Deposit_event>; createMockEvent: (args:Vault_Deposit_createMockArgs) => Types_Vault_Deposit_event }; Fulfilment: { processEvent: EventFunctions_eventProcessor<Types_Vault_Fulfilment_event>; createMockEvent: (args:Vault_Fulfilment_createMockArgs) => Types_Vault_Fulfilment_event } } = TestHelpersJS.Vault as any;

export const MockDb: { createMockDb: () => TestHelpers_MockDb_t } = TestHelpersJS.MockDb as any;
