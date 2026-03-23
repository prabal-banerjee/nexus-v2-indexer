  @genType
module Vault = {
  module Deposit = Types.MakeRegister(Types.Vault.Deposit)
  module Fulfilment = Types.MakeRegister(Types.Vault.Fulfilment)
}

@genType /** Register a Block Handler. It'll be called for every block by default. */
let onBlock: (
  Envio.onBlockOptions<Types.chain>,
  Envio.onBlockArgs<Types.handlerContext> => promise<unit>,
) => unit = (
  EventRegister.onBlock: (unknown, Internal.onBlockArgs => promise<unit>) => unit
)->Utils.magic
