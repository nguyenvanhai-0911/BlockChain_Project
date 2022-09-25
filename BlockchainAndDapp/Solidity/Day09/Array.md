### *** Solidity Arrays ***

1. Fixed-size
- Has a compile-time fixed size.
- Can store any type (int, uint, address, struct etc).
- bytes1, bytes2, ..., bytes32 store a sequence of bytes.
- Has member called length.

2. Dynamically-sized arrays
- byte[ ]
- byte[ ] is an alias to bytes
- string (UTF-8 encoding)
- uint[], int[ ]
- members: length and push