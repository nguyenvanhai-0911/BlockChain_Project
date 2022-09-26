### *** Structs ***
- A struct is a collection of key->value pairs;
- A struct introduces a new complex data type, that is composed of elementary data types;
- Structs are used to represent a singular thing that has properties such as a Car, a Person, a Request and so on and we use mappings to represent a collection of things like a collection of Cars, Requests etc;
- A struct is saved in storage and if declared inside a function it references storage by default;
- Exemple:
    struct Car { 
        string brand;
        uint price; 
    }