import Cocoa

// Functions

// Example of a simple function with one parameter:
func printTimesTable(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTable(number: 5)

// Example of a simple function with two parameters:
func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

// Note: Arguments must be in the same order as the parameters.
printTimesTables(number: 5, end: 20)

// An example of a return:
func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)


// Return a true if string1 matches string2 after being sorted:
func areLettersIdentical(string1: String, string2: String) -> Bool {
    return string1.sorted() == string2.sorted()
}

print(areLettersIdentical(string1: "tets", string2: "test")) // returns true as letters are sorted
print(areLettersIdentical(string1: "tetss", string2: "test")) // returns false as letters are sorted

// Return a double:
func pythagoras(a: Double, b: Double) -> Double {
    let input = (a * a) + (b * b)
    let root = sqrt(input)
    
    return root
}

let c = pythagoras(a: 3, b: 4)
print(c)

// A shorter way to do the above:
func pythagorasShorter(a: Double, b: Double) -> Double {
    return sqrt((a * a) + (b * b))
}

let d = pythagorasShorter(a: 3, b: 4)
print(d)

// Return multiple values with a tuple with named attributes:
func getUser() -> (firstName: String, lastName: String) {
    return (firstName: "Taylor", lastName: "Swift")
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")

// Return multiple values with a tuple without named attributes:
func getUserAgain() -> (String, String) {
    return ("Taylor", "Swift")
}

let userTwo = getUserAgain()

print("Name: \(userTwo.0) \(userTwo.1)")

// Last example but this time use some destructuring:

func getUserThree() -> (firstName: String, lastName: String) {
    return (firstName: "Taylor", lastName: "Swift")
}

// Instead of:
// let user = getUser()
// let firstName = user.firstName
// let lastName = user.lastName

// Use:
let (firstName, lastName) = getUserThree()
print("Name: \(firstName) \(lastName)")

// or the below if you just want the firstName:
// let (firstName, _) = getUserThree()
// print("Name: \(firstName)")

// Adding default values for parameters in a function:

func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)

// Handle errors in functions:

// Create an enum to offer two error strings:
enum PasswordError: Error {
    case short, obvious
}

// Next, create a function that tests a password string for certain criteria.
// If a condition matches either a short or obvious password, it throws an error:
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

// Define a constant that will contain the password to check:
let passwordString = "12345mkglkndkg.ljfbhguihtiehghsgh949u4yrie9uoigkj"

// Lastly, use a do, try and catch to check the password against the function:
do {
    let result = try checkPassword(passwordString)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}
