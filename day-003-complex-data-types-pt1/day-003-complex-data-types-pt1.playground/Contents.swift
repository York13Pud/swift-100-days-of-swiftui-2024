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
