import Cocoa

// A simple function that is also copied to a variable:
func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy = greetUser
greetCopy()


// A very simple example of a closure:
let sayHello = {
    print("Hi there!")
}

sayHello()

// A more useful example of an inline closure that includes parameters:
let sayHelloAgain = { (name: String) -> String in
    return "Hi \(name)!"
}


print(sayHelloAgain("me"))


// Another example of an inline closure that sorts an array with a custom sort method:
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let captainFirstTeamClosure = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})

print(captainFirstTeamClosure)

// Trailing closures

// Using the previous example, there is a shorter way to write it using a trailing closure:

let captainFirstTeamTrailingClosure = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}



// Shorthand syntax

let captainFirstTeamShorthand = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}

// Better example that reverse sorts the array:
let reverseTeam = team.sorted {
    return $0 > $1
}

// Or an even shorter way given it is one line of code:

let reverseTeamShorter = team.sorted { return $0 > $1 }

print(reverseTeamShorter)

// Other examples using shorthand syntax:

// Use filter on the team array:
let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

// Use map to transform the array contents to uppercase:
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

let testing = ["1", "2"]

let toInteger = testing.map { Int($0)! }
print(toInteger)
