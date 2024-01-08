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
var text = "more"

for _ in 1...5 {
    text += " more"
}

print(text)

// If you just want to print the values of an array, you can do so with a range in the [] instead of using a for loop:
print(platforms[0...])

// Use an array just in the for loop:
for number in [2, 3, 5] {
    print("\(number) is a prime number.")
}

// While loops:

// A basic while loop:
var countdown = 10

while countdown > 0 {
    print("\(countdown)…")
    countdown -= 1
}

print("Blast off!")

// Another example using a random number:

// create an integer to store our roll
var roll = 0

// carry on looping until we reach 20
while roll != 20 {
    // roll a new dice and print what it was
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

// if we're here it means the loop ended – we got a 20!
print("Critical hit!")

var speed = 50
while speed <= 55 {
    print("Accelerating to \(speed)")
    speed += 1
}

// Skipping in a loop

// Skip an item in a loop:

let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }

    print("Found picture: \(filename)")
}

// Exit out of the loop:

let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)

        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)

// Break out of a specific loop in a nested loop using labeled statements:
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
