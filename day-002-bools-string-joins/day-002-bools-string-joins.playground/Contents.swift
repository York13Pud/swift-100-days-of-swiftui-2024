import Cocoa

// booleans:

// Store a boolean:
var storedBool = true

// You can use reverse logic with ! on bools:
var isAuthenticated = false

isAuthenticated = !isAuthenticated
print(isAuthenticated) // true

isAuthenticated = !isAuthenticated
print(isAuthenticated) // false

// Another method to switch a boolean is with toggle:
var gameOver = false
print(gameOver) // false

gameOver.toggle()
print(gameOver) // true

print(1 == 2)
