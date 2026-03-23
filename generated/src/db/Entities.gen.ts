/* TypeScript file generated from Entities.res by genType. */

/* eslint-disable */
/* tslint:disable */

export type id = string;

export type whereOperations<entity,fieldType> = {
  readonly eq: (_1:fieldType) => Promise<entity[]>; 
  readonly gt: (_1:fieldType) => Promise<entity[]>; 
  readonly lt: (_1:fieldType) => Promise<entity[]>
};

export type VaultEvent_t = {
  readonly blockNumber: number; 
  readonly blockTimestamp: number; 
  readonly chainId: number; 
  readonly emitter: string; 
  readonly eventType: string; 
  readonly id: id; 
  readonly logIndex: number; 
  readonly requestHash: string; 
  readonly solver: (undefined | string); 
  readonly txHash: string
};

export type VaultEvent_indexedFieldOperations = { readonly requestHash: whereOperations<VaultEvent_t,string> };
