###     *** Transaction Fileds ***

* Example :

from: "0x9300d2bB77C695FE8708692Cc56A3a4dDF14A1D5" to: "0x22331B228721e09E6916CB7d17C8Db20bbAF5C22" value: "10000000000"
gasLimit: "21000"
gasPrice: "120"
data: "0xabcd",
nonce: "5",
hash: "0x1009e8720dc6250e095dca3f4f296c8b8940302be0b367e85dbfe5caace057ca"

### *** Transaction vs. Call ***

1. Transaction (Ex: contract deployment, token transfer)
    - Modifies the blockchain
    - Costs gas
    - It must be mined, takes time
    - Returns a transaction id (hash) - txid

2. Call (Ex: GetBalance)
    - Doesn’t modify the blockchain
    - It’s free
    - Doesn’t have to be mined, instant execution
    - Returns a value