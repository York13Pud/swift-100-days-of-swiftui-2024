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

They are very simple to create. Note that when you are creating something from a struct and are passing in a value, you *must* pass the name of the parameter for that value.

One difference to typical naming conventions is that struct names should start with a capital letter instead of using camel case.

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

## Computed Properties

Within a struct, you can dynamically create a computed properties value very easily. For example, create a computed property value for `vacationRemaining`:

``` swift
struct EmployeeCP {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaining: Int {
        vacationAllocated - vacationTaken
    }
}

var archerTwo = EmployeeCP(name: "Sterling Archer", vacationAllocated: 14)

archerTwo.vacationTaken += 4
print(archerTwo.vacationRemaining) // Prints 10

archerTwo.vacationTaken += 4
print(archerTwo.vacationRemaining) // Prints 6
```

Very simple. The only limitation with this way of doing a computed property value is that you can only read it. To get around this, you can use a `get` and `set` within the property. For example:

``` swift
struct EmployeeCPTwo {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archerThree = EmployeeCPTwo(name: "Sterling Archer", vacationAllocated: 15)

archerThree.vacationTaken += 5
archerThree.vacationRemaining = 5
print(archerThree.vacationAllocated) // Prints 10
print(archerThree.vacationRemaining) // Prints 5
```

The above example will set `vacationAllocated` to `10`. The `get` section is basically not used.

`newValue` is a special value for `set` that is used to place the value that was passed when the `vacationRemaining` method was called.

Note: Constants cannot be computed properties.

## Property Observers

Swift lets us create property observers, which are special pieces of code that run when properties change. These take two forms: a `didSet` observer to run when the property just changed, and a `willSet` observer to run before the property changed.

For example:

``` swift
struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")
```

`oldValue` and `newValue` again are special functions that are used in structs. They are pretty self explanatory.

## Custom Initialisers

Custom initialisers allow us to create custom properties that can be simply assigned from an argument or be computed, both when the struct is first called.

There is one rule: *All the values in the struct must have a value by the end of the initialisation.*

``` swift
struct Player {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Megan R")
print("\(player.name) is number \(player.number)")
```

In the above example, number does not need `self.` as it is not being passed a value when the struct is built. `name` on the other hand does require it because it is being passed a value.