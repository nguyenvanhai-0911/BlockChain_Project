### ***  Ethereum Address ***
- An EOA Address is derived from the last 20 bytes (160 bits) of the public key that are Keccak-256 hashed. It’s represented in a hexadecimal format, which is often indicated explicitly by appending 0x to the address
    Example: `0xCC713690827C96b8b0b5456F34B23dCC7D03aEd2`

- The address for an Ethereum Contract is deterministically computed from the address of its creator (sender) and how many transactions the creator has sent (nonce).

- There is a lower-case address version and partial upper-case version that also contains a checksum.
    + `0x0d8775f648430679a709e98d2b0cb6250d2887ef`
    + `0x0D8775F648430679A709E98d2b0Cb6250d2887EF`