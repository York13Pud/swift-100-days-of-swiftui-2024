# Optionals And Nil

## Optionals

Optionals are values that may or may not have a value. Typically, this would be done by using a `?` with a datatype. For example, an optional string would be `String?`. If there is no value, then it is `nil` (none or null in some other languages). For example:

``` swift
var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}
```

In the case of the above example, it would print `The optional was empty.` as `username` is `nil` because no value was passed to `username`. Now, let's expand that into a solution that will return the same but then also print out the text when a `username` is set.

``` swift
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
```

There wasn't much in the way of changes. The `if` statement was put into a function because the code would be used more than once but the rest is the same. Once `username` was assigned a value (`Fred`), it was still an optional but it became an optional with a value to it became `true` in the `if` statement.

## Unwrap Optionals With Guard

`Guard` allows us another method to unwrap and check an optional. The difference between `guard else` and `if` is that `guard` will run code if there is no value inside the optional. It also requires a return.

For example:

``` swift
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
```