###     *** Built-in Global Variables ***
- msg -> contains information about the account that generates the transaction and about the transaction or call, as well.
    + msg.sender -> account address that creates and sends the transaction.
    + msg.value -> ETH value (represented in wei) sent to this contract.
    + msg.data -> data field in the transaction or call that called the function.

- this -> the current contract, explicitly convertible to Address. (address)this.balance returns the contract balance.

- gasleft() -> returns the remaining gas.

- block.timestamp -> returns the total running seconds since the Unix Epoch.
    + block.number
    + block.difficulty
    + block.gaslimit
    
- tx.gasprice -> gas price of the transaction