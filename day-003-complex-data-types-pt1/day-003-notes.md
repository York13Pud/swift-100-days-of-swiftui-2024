# Complex Data Types

## Arrays

Arrays can only hold one datatype, such as strings, booleans, integers or doubles. It will determine the datatype to use based on the first entry in the array if there are any present.

An array can be initialised as an empty array but you will have to set the datatype.

## Dictionaries

A dictionary requires a default value for each key when accessed. This allows for a value to be shown if the key does not exist.

``` swift
let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]

print(employee2["name", default: "Unknown"])
```