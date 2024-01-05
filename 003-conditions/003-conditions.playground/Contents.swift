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

