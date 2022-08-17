### *** Gas Limit ***
- For any transaction there are 2 variables: gasPrice and gasLimit
- gasLimit (startGas) is the maximum gas the transaction can consume. This avoids DoS attacks by setting the maximum no. of computation steps of code execution.
- Gas from all transactions in a block will be received by the miner that validates the block;
- Ethereum has a block gas limit rather than a block size;