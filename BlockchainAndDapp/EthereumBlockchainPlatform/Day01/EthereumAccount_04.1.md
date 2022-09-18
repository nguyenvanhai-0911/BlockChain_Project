###  *** Externally Owned Account (EOA) ***

- Controlled by a private key and identified by an unique address;

- It holds an ETH balance and has no associated code;

- Used for holding, sending and receiving ETH and for interacting with smart contracts (deployment, calling functions etc);


### *** Contract Account (CA) ***

- Controlled by the contract code;

- Has a unique address but doesn’t have a public or a private key;

- It’s an autonomous agent and it’s code execution is triggered by receiving a transaction or a message (call) from another contract of an EOA;

- It holds an ETH balance like an EOA;

###  ***  Ethereum Account Components ***

1. Nonce -> counter that indicates the number of transactions sent from the account (it ensure that the same transaction isn't submitted twice)

2. Balance (in wei)

3. Account Address

4. Account Private & Public Key (only for EOA)

5. Code (only for the contract account). This is the immutable EVM bytecode. 6. Storage (only for the contract account, empty by default)