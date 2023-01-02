### *** Mappings ***

- It’s a data structure that holds key->value pairs. Its similar to Python Dictionaries, JS objects or Java HashMaps;

- All keys must have the same type and all values must have the same type;

- The keys can not be of types mapping, dynamic array, enum or struct. The values can be of any type including mapping;

- Mapping is always saved in storage, its’ a state variable. Mappings declared inside functions are also saved in storage;

- The mappings advantage is that lookup time is constant no matter mapping’s size.

- A mapping is not iterable, we can’t iterate through a mapping using a for loop;

- Keys are not saved into the mapping (its a hash table data structure). To get a value from the mapping we provide a key, the key gets passed through a hashing function, that outputs a predetermined index that returns the corresponding value from the mapping;

- If we want the value of an unexisting key we get a default value;
    