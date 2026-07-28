import { Vault } from "../generated/src/Handlers.gen";

Vault.Deposit.handler(async ({ event, context }) => {
  context.VaultEvent.set({
    id: `${event.chainId}_${event.transaction.hash}_${event.logIndex}`,
    requestHash: event.params.requestHash,
    eventType: "deposit",
    chainId: event.chainId,
    txHash: event.transaction.hash,
    blockNumber: event.block.number,
    logIndex: event.logIndex,
    emitter: event.params.from,
    solver: undefined,
    blockTimestamp: event.block.timestamp,
  });
});

Vault.Fulfilment.handler(async ({ event, context }) => {
  context.VaultEvent.set({
    id: `${event.chainId}_${event.transaction.hash}_${event.logIndex}`,
    requestHash: event.params.requestHash,
    eventType: "fulfillment",
    chainId: event.chainId,
    txHash: event.transaction.hash,
    blockNumber: event.block.number,
    logIndex: event.logIndex,
    emitter: event.params.from,
    solver: event.params.solver,
    blockTimestamp: event.block.timestamp,
  });
});
