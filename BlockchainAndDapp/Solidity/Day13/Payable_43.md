###     *** Payable functions and contract balance ***

- A smart contract can receive ETH and can have an ETH balance only if there’s at least one payable function.

- A contract receives ETH in multiple ways:
    a. Just by sending ETH to the contract address from another account.
        The contract must have at least one of the functions below:
            + receive() external payable - for empty calldata (and any value)
            + fallback() external payable - when no other function matches (not even the receive function).
    b. By calling a payable function and sending ETH with that transaction.

- The ETH balance of the contract is in possession of anyone who can call the transfer() built-in function