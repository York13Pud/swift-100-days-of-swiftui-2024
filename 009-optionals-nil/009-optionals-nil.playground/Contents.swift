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
