###     *** Solidity Variables ***
Variable Types:
1. State variables
    - Declared at contract level;
    - Permanently stored in contract storage;
    - Can be set as constants;
    - Expensive to use, they cost gas;
    - Initialized at declaration, using a constructor or after contract deployment by calling setters;

2. Local variables
    - Declared inside functions;
    - If using the memory keyword and are arrays or struct, they are allocated at runtime. Memory keyword can’t be used at contract level


###     *** Where does EVM save data ?
1. Storage
    - Holds state variables;
    - Persistent and expensive (it costs gas);
    - Like a computer HDD;

2. Stack
    - Holds local variables defined inside functions if they are not reference types (ex: int);
    - Free to be used (it doesn’t cost gas); 3. Memory
    - Holds local variables defined inside functions if they are reference types but declared with the memory keyword;
    - Holds function arguments;
    - Like a computer RAM;
    - Free to be used (it doesn’t cost gas); Reference Types: string, array, struct and mapping