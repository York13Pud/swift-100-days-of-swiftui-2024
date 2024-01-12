import Cocoa

// Structs

// A simple struct example:
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

// Another example. This time with a mutating method to update a variable:
struct Employee {
    let name: String
    var vacationRemaining: Int = 25

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

// Compute property values dynamically

// Simple computed property:
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
print(archerTwo.vacationRemaining)
archerTwo.vacationTaken += 4
print(archerTwo.vacationRemaining)

// Using get and set:
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

var archerThree = EmployeeCPTwo(name: "Sterling Archer", vacationAllocated: 20)

archerThree.vacationTaken += 5
print(archerThree.vacationAllocated)
print(archerThree.vacationTaken)

archerThree.vacationRemaining = 5
print(archerThree.vacationRemaining)
print(archerThree.vacationAllocated)

// Property Change Actions

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
