import Cocoa

// Check if a var is empty or not:
var myString = "Hello world!"

if myString.isEmpty { // isEmpty is a boolean so no need to compare it with == true
    myString = "I was empty but now I'm not!"
}

print(myString)




// An if, else if and else example:
enum TransportOption {
    case airplane, helicopter, bicycle, car, scooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path…")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now!")
}

if "a" > "B" { // 61 > 42 in hex, 97 vs. 66 in dec
    print("A")
} else {
    print("b")
}

// Switch Statements:

let place = "Metropolis"

switch place {
case "Gotham":
    print("You're Batman!")
case "Mega-City One":
    print("You're Judge Dredd!")
case "Wakanda":
    print("You're Black Panther!")
default:
    print("Who are you?")
}

print(place)


// Use fallthrough so that when the value is met, it will carry on through the other cases in the switch:
let day = 5
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves and")
    fallthrough
default:
    print("A partridge in a pear tree")
}

// Ternary Operator:

// A simple example:
let ageTern = 18
let canVoteTern = ageTern >= 18 ? "Yes" : "No"

// Another example:
enum Theme {
    case light, dark
}

let theme = Theme.dark

let background = theme == .dark ? "black" : "white"
print(background)

// One last example:
let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")

// for loops

// Loop over an array:
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os).")
}

// Loop over a range:
// Including the last number in the range:
for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

// Up to the last number in the range but not running against that number (the way Python handles ranges)L
for i in 1..<5 {
    print("Counting 1 up to 5: \(i)")
}

// Nested for loops:
for i in 1...12 {
    print("The \(i) times table:")

    for j in 1...12 {
        print("  \(j) x \(i) is \(j * i)")
    }

    print()
}

// Iterate over a loop with no variable defined (basically, add more to the lyric five times:
var lyric = "more"

for _ in 1...5 {
    lyric += " more"
}

print(lyric)

