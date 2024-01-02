import Cocoa

// This is a variable. The assigned value can be changed:
var greeting = "Hello, playground"
print(greeting)

greeting = "Hello, World!"
print(greeting)

// This is a constant. Once its value has been set, it cannot be changed:
let person = "Fred"


// Strings:

// An example of multiline strings:
let multilineExanple = """
This is an
example of a multi-line string
"""

print(multilineExanple)

// Get the length of a string:
print(person.count)

// Display a string as uppercase:
print(person.uppercased())

// Display a string as lowercase:
print(person.lowercased())

// Check if a string has a particular prefix:
print(greeting.hasPrefix("Hello"))

// Check if a string has a particular suffix:
print(greeting.hasSuffix(".jpg"))


// Integers:

// A simple example:
let scoreOne = 100

// Using separators for long numbers. The _ are ignored by swift:
let scoreTwo = 100_000_000

// You can use arithmetic operators as well
let scoreThree = 10 + 2

// Add to an existing var value:
var counter = 100
counter += 1 // This is called a compound assignment operator

// You can do the same for subtraction:
counter -= 11


// Decimals:
