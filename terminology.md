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

### Operator Overloading

Operator overloading basically means using an operator, such as `+` to be used for more than one thing.

Typically, `+` would be used to add numbers together but it can also be used to join strings together, along with other possibilities.

``` swift
// Perform a simple maths operation:
print(1 + 2) // prints 3

// Perform a string join:
let first = "Hello, "
let second = "world"

print(first + second + "!")
```

### String Interpolation

String interpolation is used as a better way to join strings together. Using the `+` method while doable, it can be slow as it needs to add each string to each other in sequence.

``` swift
let first = "Hello,"
let second = "world"

// Using the + method:
print(first + " " + second + "!")

// Using string interpolation:
print("\(first) \(second)!")
```

Using string interpolation also allows for other datatypes, such as integers to be used in the string without converting them to a string first. Using the `+` method would require that the integer first be converted to a string using typecasting.

## Compound Assignment

Compound assignment operators allow you to perform a mathematical action to a variable and assign that variable the new value.

For example, let's say you wanted to add 10 to a variable that is an existing integer. There are two ways to do it:

First, add 10 to the variable and assign it to that variable name:

``` swift
var myNumber = 10
print(myNumber) // 10

myNumber = myNumber + 10
print(myNumber) // 20
```

The cleaner method is to use compound assignment to do the same thing:

``` swift
var myNumber = 10
print(myNumber) // 10

myNumber += 10
print(myNumber) // 20
```

With compound assignment, only the value needs to be put after the `=`.

The `+=` is the compound assignment operator which will add to the existing value of `myNumber`.

You can use:

- `+=` to add
- `-=` to subtract
- `*=` to multiply and
- `/=` to divide by

### Type Safety

Type safety is hard coded into Swift to ensure that a variable cannot be changed from one data type to another. For example, if a variable is initialised as an integer and you want to store a string in that variable, swift will not permit it.

### Type Inference

Type Inference is the process where Swift determines the datatype for a variable or a constant, based on what is assigned to it.

For example, the below would assign the constant a string datatype because the assigned data is a string:

``` swift
let stringExample = "Hello"
```

### Type Annotations

Type annotations allow you to specify the datatype for a variable or a constant.

For example, the below would assign the constant a double datatype because you have defined the constant to be a double, rather than what the data is, which is an integer:

``` swift
let doubleExample: Double = 1
```

## Loops

### Labeled Sttements

Swift’s labeled statements allow us to name certain parts of our code, and it’s most commonly used for breaking out of nested loops. For example, break out of a nested for loop using a labeled statement to specify the loop to exit.

``` swift
let options = ["up", "down", "left", "right"]
let secretCombination = ["up", "up", "right"]

outerLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]

            if attempt == secretCombination {
                print("The combination is \(attempt)!")
                break outerLoop
            }
        }
    }
}
```

If the first loop was not labeled, the loop would have continued as on of the loops would not have broken.
