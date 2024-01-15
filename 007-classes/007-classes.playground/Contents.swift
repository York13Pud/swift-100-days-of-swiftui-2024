import Cocoa

// A simple class:
class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

// Two classes that inherit from the Employee class:
final class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
robert.work()

let joseph = Manager(hours: 10)
joseph.work()

let novall = Developer(hours: 8)
novall.printSummary()

// Class initialisers and inheritance
class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)

class Instrument {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class Piano: Instrument {
    var isElectric: Bool
    init(isElectric: Bool) {
        self.isElectric = isElectric
        super.init(name: "Piano")
    }
}

// Copying Classes
class User {
    var username = "Anonymous"
}

var user1 = User()
var user2 = user1
user2.username = "Taylor"

print(user1.username)
print(user2.username)

class UserName {
    var username = "Anonymous"

    func copy(username: String) -> UserName {
        let person = UserName()
        person.username = username
        return person
    }
}

var personOne = UserName()
print(personOne.username)

var personTwo = personOne.copy(username: "Fred")
print(personTwo.username)

personTwo.username = "Fredie"
print(personTwo.username)

// De-initialisers
class UserDeInt {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}

var users = [UserDeInt]()

for i in 1...3 {
    let user = UserDeInt(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll() // As each item in the array is removed, the deinit runs.
print("Array is clear!")
