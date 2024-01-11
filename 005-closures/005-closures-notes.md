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
