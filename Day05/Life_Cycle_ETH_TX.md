### *** Life Cycle of an Ethereum Transaction ***

1. The client constructs the raw transaction object;
2. The client signs the transaction with the private key and validates it locally;
3. The transaction is broadcasted to the network by the Ethereum Client and a transaction ID (txid) is returned;
4. The transaction is added to the transaction pool and waits there to be validated by the miner.A miner node accepts the transaction. Ethereum Network has a mix of miner nodes and non-miner nodes.
5. Miner finds a valid block by solving the PoW puzzle (or PoS) and adds the new block to the existing blockchain. The number of transactions in the block depends on the block gas limit.
6. The miner node broadcasts the new block to all other nodes; All nodes execute the transactions from the new block, but only the miner gets paid. (block reward + transactions fee - gas).