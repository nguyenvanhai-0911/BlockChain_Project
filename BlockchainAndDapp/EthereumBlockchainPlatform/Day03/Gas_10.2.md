###     *** Gas ***

- Gas measures how much work a transaction’s code does;

- Any transaction that modifies the blockchain in any way costs gas. Any basic operation or data storage costs gas;

- The user that generates the transaction pays for the gas;

- gasPrice is the amount of wei the transaction sender wants to pay per unit of gas to get the transaction mined (processed). gasPrice is set by the user;

- An OPCODE is a basic operation executed by the EVM such as addition (+), multiplication (*), division (/), etc;

- The gas from all the transactions in a block will be received by the miner that validates the block;

- The higher the gasPrice, the faster the transaction will be mined;

- Example:

    + Multiplication operation (MUL): 5 gas

    + Addition operation (ADD): 3 gas

    + Equality comparison (EQ): 3 gas

    => Total gas: 11 gasLimit = 21,000 gasPrice is 50Gwei (50,000,000,000 wei) 
    Transaction fee: 50,000,000,000 * 11 = 50,000,000,000 wei = 55 Gwei = 0.000000055 ETH