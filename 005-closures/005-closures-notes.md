# Closures

## Copying Functions

Take the following for example:

``` swift
func myFunc() {
    print("hello world!")
}
myFunc()
```

If you want to make a copy of that function into a variable, you can do the following:

``` swift
myFuncCopy = myFunc
```

There are no `()` when copying a function. If you did add them, it would just run the function and assign a return value to `myFuncCopy`

## What Are Closures?

Closures are essentially using code directly on a variable or constant that can be reused by calling the variable or constant. They are very similar to lambda functions in Python.

They can also be used to pass code into an argument for a function, such as a sorting method for sorting values in a list.

Here, for example, is an inline closure that takes one parameter:

``` swift
let sayHelloAgain = { (name: String) -> String in
    return "Hi \(name)!"
}

print(sayHelloAgain("me"))
```

Inside the `{}` the `in` keyword will signal the code that is to be run.

Here is another example that is more complex. It passes a sorting method for an array so that `Suzanne` will always be placed first in the list.

First, let's do this as a normal function and then pass the function into the `sorted` method:

``` swift
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

let captainFirstTeam = team.sorted(by: captainFirstSorted)

print(captainFirstTeam)
```

Now, let's do that again, only this time using an inline closure to pass the code into `sorted`:

``` swift
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
```


## Function Types

Let’s take this `greetUser()` function:

``` swift
func greetUser() {
    print("Hi there!")
}

greetUser()
```

It accepts no parameters, returns no value, and does not throw errors. If we were to write that as a type annotation for `greetCopy`, we’d write this:

``` swift
var greetCopy: () -> Void = greetUser
```

Let’s break that down:

1. The empty parentheses (`()`) marks a function that takes no parameters.
2. The arrow (`->`) means just what it means when creating a function: we’re about to declare the return type for the function.
3. `Void` means “nothing” – this function returns nothing. Sometimes you might see this written as `()`, but we usually avoid that because it can be confused with the empty parameter list.

## Trailing Closures

Trailing closures allow us to write closures with less code. Take for example the following closure:

``` swift
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let captainFirstTeamClosure = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})
```

This can be shortened with a trailing closure:

``` swift
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let captainFirstTeamTrailingClosure = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}
```

Jury is out on if I would use them as they do remove datatypes for each parameter and the return type declaration but they are understandable.

Next up, there is one other method that can be used, which is called shorthand syntax. This uses `$` pointers to mark a point where a parameter would be for a function. Given that we are using the `sorted` function, it requires two parameters so `$0` and `$1` are used instead of `name1` and `name2`.

Using the above trailing closure example, let's write it using shorthand syntax:

``` swift
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let captainFirstTeamShorthand = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}
```

Generally, you wouldn't use shorthand syntax for this as the code accesses `$0` and `$1` twice. A better example would be one that uses sort to reverse an array:

``` swift
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let reverseTeam = team.sorted {
    return $0 > $1
}

// Or an even shorter way given it is one line of code:

let reverseTeamShorter = team.sorted { $0 > $1 }
```

Some additional examples of using shorthand syntax:

``` swift
// Use filter on the team array:
let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

// Use map to transform the array contents to uppercase:
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)
```

## Map Function

The `map()` function lets us transform every item in the array using some code of our choosing, and sends back a new array of all the transformed items.

When working with `map()`, the type you return doesn’t have to be the same as the type you started with – you could convert an array of integers to an array of strings, for example.

One last example. Convert an array of string numbers to an array of integers:

``` swift
let testing = ["1", "2"]

let toInteger = testing.map { Int($0)! }
print(toInteger)
```

The `!` will insert just the integer value in, not the optional value.
