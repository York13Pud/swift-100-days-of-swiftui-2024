import Cocoa

// Arrays:

// Create an array of strings:
var names = ["Bob", "Fred", "Frank"]

// Print out the first item in the array:
print(names[0])

// Add to the array:
names.append("Brian")

// Print out the items in the array:
print(names)

// Remove the last item in the array:
names.remove(at: 3)

// Print out the items in the array:
print(names)

// Show the number of items in the array:
print(names.count)

// Search the array by value. It will return true or false:
print(names.contains("Fred"))

// Sort an array. This will not update the order of the items in the array:
print(names.sorted())

// Reverse an array. This will not update the order of the items in the array:
print(names.reversed())

print(names)

// Create an empty array that will contain integers.
// Note: If you don't specify the datatype for the array (<Int> in this case), XCode will not allow it:
var scores = Array<Int>()

// Add values to the array:
scores.append(1)
scores.append(2)
scores.append(3)

// Print the scores array:
print(scores)

// Another way to write out an empty array in a more shorthanded way:
var albums = [String]()

// Dictionaries:

// Create a simple dictionary:
let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]

// Read each key in the dict.
// default (required) will show unknown if the key is not found:
print(employee2["name", default: "Unknown"])
print(employee2["job", default: "Unknown"])
print(employee2["location", default: "Unknown"])

// Create an empty dict and then add values to it:
var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"

// Update the entry for Batman:
archEnemies["Batman"] = "Penguin"

// Count the number of items in a dict:
print(archEnemies.count)

// Sets:

// Create a simple set:
let people1 = Set([
    "Denzel Washington",
    "Tom Cruise",
    "Nicolas Cage",
    "Samuel L Jackson"
])

// Print the contents of the set. The order will likey be different:
print(people1)

// Search for an entry:
print(people1.contains("Tom Cruise"))

// Show how many entries there are:
print(people1.count)

// Create and empty set:
var people2 = Set<String>()

// Add entries to the set:
people2.insert("Denzel Washington")
people2.insert("Tom Cruise")
people2.insert("Nicolas Cage")
people2.insert("Samuel L Jackson")

// Add an existing value. The response will be inserted: false:
people2.insert("Samuel L Jackson") // Won't work as value already exists.

// Enums:

// An example of an enum that contains all of the working weekdays:
enum weekdayLong {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
}

// Using the same example above but do it in a shorter way:
enum weekdayShort {
    case Monday, Tuesday, Wednesday, Thursday, Friday
}

// Print an example of one of the enum values:
print(weekdayLong.Monday)
