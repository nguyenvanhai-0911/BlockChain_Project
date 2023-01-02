###     *** Enums ***

- Enums are used to create user-defined types;

- Enums are explicitly convertible to and from integer;

- Enums are user defined types that contain human readable names for a set of constants, called members.

- Example:
    enum State { 
        Open, 
        Closed, 
        Active, 
        Unknown
    } 
    State public academyState = State.Active;