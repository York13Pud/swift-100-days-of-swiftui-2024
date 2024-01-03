# Terminology

## Variables and Constants

### Variable

A variable (`var`) is used to store data that is used multiple times and can be changed when needed.

``` swift
var myVar = "This is a variable"
```

### Constant

A constant (`let`) is used to store data that is used multiple times. The difference is that unlike variables, once a constants value has been set, it cannot be changed.

``` swift
let myConst = "This is a constant. I cannot be changed."
```

## Datatypes

### Integer

An integer (`int`) is a whole number.

``` swift
let a = 1
```

### Double

A double (`double`) is a number with decimal places. A double is similar to a float but it is double the precision of a float, which is 32-bits and a double is 64-bits.

``` swift
let b = 2.0
```

### Boolean

A boolean (`bool`) is a datatype that is used to show or store truth. A boolean value is either `true` or `false`.

``` swift
var isGreen = true

print(1 == 1) // prints true
print(1 == 2) // prints false
```

### String

A `string` is a collection of characters that are stored within a set of `" "`. It is used mostly for text but can store numbers and other symbols, such as emojis.

``` swift
let myString = "This is a string."
```

### Typecasting

Typecasting is the process of converting one datatype to another so that an operation can be completed between two incompatible datatypes.

For example, adding a double to an integer.

``` swift
let a = 1
let b = 2.0

// Now, to add a and b, one will need to be converted (not changed) to the others format. For example, convert b:

print(a + Int(b))
```

Note: The value stored in b is not changed. It is only converted for that one operation. Its value is still `2.0`.