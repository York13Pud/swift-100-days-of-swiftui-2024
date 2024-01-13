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

// Property Observers

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

// Custom Initialisers

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

// Access Control

// An example to limit the changes to a property to two methods within the struct:
struct BankAccount {
    private(set) var funds = 100

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
// account.funds -= 1000 // This will throw an error as you cannot modify a private var outside of the struct
print(account.funds) // As funds is marked as private(set), funds can be read from outside the struct

// Static Properties and Methods

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

print(AppData.version)
