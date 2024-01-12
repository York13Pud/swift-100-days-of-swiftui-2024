# Structs And Computed Properties

## Structs

Structs are used to create a custom datatype that can hold variables, constants and functions (named methods). They are similar to classes but have some differences:

- Classes need to have an `init` section to initialise all of the variables and constants. Structs don't need this as it is done automatically.
- Copying a class will only create a copy of the pointer to where the class is stored in memory. This means that if you make a change to the copy, it will also change the original. Struct however do create a separate copy so the original is not altered.

Below is an example of a simple struct:

``` swift
struct Album {
    let title: String
    let artist: String
    let year: Int

    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()
```

They are very simple to create. One difference to typical naming conventions is that struct names should start with a capital letter instead of using camel case.

Now, one important note, if you mix variables and constants, it will treat everything as a constant so if you want to make a change to the value of a variable in a struct, you need to mark the method (function) as `mutating`. For example:

``` swift
struct Employee {
    let name: String
    var vacationRemaining: Int

    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)
```

Lastly. If you specify a default value on a variable in a struct, you will be ok to either pass a new value in or not pass a value in. If you do so with a constant, you cannot pass in a value as swift will not allow it.
