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

## Sets

Sets are similar to array but they don't allow for duplicates and the order of the entries is not maintained.

Sets are also faster when searching for item versus an array.

## Enums

A collection of values that can be used in your code. For example, you can create an enum with the days of the week.

They are also memory efficient as the only value that is stored in memory is the index, rather than the full value. For example, using the 5 days of the working week, rather than the name of the day, only 0 to 4 will be stored in memory.

Think of them as a curated list that can be used to reflect a value, such as the contents of a drop-down list in a form. For example, the days of the week:

``` swift
// An example of an enum that contains all of the working weekdays:
enum weekdayShort {
    case Monday, Tuesday, Wednesday, Thursday, Friday
}

// Print an example of one of the enum values:
print(weekdayLong.Monday) // Prints Monday
```