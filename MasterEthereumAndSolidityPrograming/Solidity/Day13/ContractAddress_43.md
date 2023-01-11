###     *** Contract Address ***

- Any contract has its own unique address that is generated at deployment.

- The contract address is generated based on the address of the account that deploys the contract and the no. of transactions of that account (nonce). It can’t be calculated in advance.

- Address is a variable type and has the following members:
    + balance
    + If the address is declared payable it has two additional members:
        * transfer(): should be used in most cases as it's the safest way to send ether
        * send(): is like a low-level transfer(). If execution fails the contract will not stop and send() returns false;
    + call(), delegatecall(), staticcall()
Example: 0xf8e81D47203A594245E36C48e151709F0C19fBe8