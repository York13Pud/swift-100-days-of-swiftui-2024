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

## Handle Multiple Optionals Using Optional Chaining

Optional chaining is a simplified syntax for reading optionals inside optionals. That might sound like something you’d want to use rarely, but here is an example to see why it’s helpful:

``` swift
let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")
```

That uses two optional features at once: you’ve already seen how the nil coalescing operator helps provide a default value if an optional is empty, but before that you see optional chaining where we have a question mark followed by more code.

Optional chaining allows us to say “if the optional has a value inside, unwrap it then…” and we can add more code. In our case we’re saying “if we managed to get a random element from the array, then uppercase it.” Remember, randomElement() returns an optional because the array might be empty.

To give you an example that pushes optional chaining harder, imagine this: we want to place books in alphabetical order based on their author names. If we break this right down, then:

- We have an optional instance of a Book struct – we might have a book to sort, or we might not.
- The book might have an author, or might be anonymous.
- If it does have an author string present, it might be an empty string or have text, so we can’t always rely on the first letter being there.
- If the first letter is there, make sure it’s uppercase so that authors with lowercase names such as bell hooks are sorted correctly.

``` swift
struct Book {
    let title: String
    let author: String?
}

var book: Book? = nil
let author = book?.author?.first?.uppercased() ?? "A"
print(author)
```