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


