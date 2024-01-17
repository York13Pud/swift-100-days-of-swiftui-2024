import Cocoa

var username: String? = nil

func checkUsername(_ toBeChecked: String?) {
    if let unwrappedName = toBeChecked {
        print("We got a user: \(unwrappedName)")
    } else {
        print("The optional was empty.")
    }
}

checkUsername(username) // Prints "The optional was empty."

username = "Fred"

checkUsername(username) // Prints "We got a user: Fred"

// Unwrap Optionals With Guard

func printSquare(of number: Int?) {
    guard let number = number else {
        // Run if number is nil:
        print("Missing input")

        // 1: We *must* exit the function here
        return
    }
    // Run if number has a value
    // 2: `number` is still available outside of `guard`
    print("\(number) x \(number) is \(number * number)")
}

printSquare(of: 5)

// Handle Multiple Optionals Using Optional Chaining

let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

struct Book {
    let title: String
    let author: String?
}

var book: Book? = nil
let author = book?.author?.first?.uppercased() ?? "A"
print(author)
