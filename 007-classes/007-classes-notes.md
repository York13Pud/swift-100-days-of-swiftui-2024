# Classes

These have many things in common with structs, but are different in key places.

First, the things that classes and structs have in common include:

- You get to create and name them.
- You can add properties and methods, including property observers and access control.
- You can create custom initializers to configure new instances however you want.

However, classes differ from structs in five key places:

1. You can make one class build upon functionality in another class, gaining all its properties and methods as a starting point. If you want to selectively override some methods, you can do that too.
2. Because of that first point, Swift won’t automatically generate a member-wise initialiser for classes. This means you either need to write your own initializer, or assign default values to all your properties.
3. When you copy an instance of a class, both copies share the same data – if you change one copy, the other one also changes.
4. When the final copy of a class instance is destroyed, Swift can optionally run a special function called a de-initialiser.
5. Even if you make a class constant, you can still change its properties as long as they are variables.

## Class Inheritance

Let's start with a simple class:

``` swift
class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }

    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}
```

Pretty simple. It provides one property, one initialiser for that property and one method. With class inheritance, the hours property can be accessed from a child class. The rule is that the class has to include the parent as the type. For example:

``` swift
class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
}
```

This now provides a new method to work with. You don't need to call the `Employee` class when creating a new var or const as it will be inherited when you create an object using the `Developer` class.

Now, if you wanted to override a method that exists in another class that was inherited from, you can use the `override` keyword at the start. Be careful, if the method doesn't exist in an inherited class, the code will not build.

Lastly, for safety, if the class is the last one, you can mark it as `final`. This will then prevent the class from being inherited from. For example:

``` swift
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

let robert = Developer(hours: 8)
robert.work()

let novall = Developer(hours: 8)
novall.printSummary()
```

## Class Initialisers And Inheritance

Classes tha inherit from another class can have their own custom initialisers. However, if the parent class has it's own initialiser and properties that don't have a default value, the child class will not build. This is due to swift needing to know the value of the parent class' properties as well in the initialiser of the child.

Swift needs the properties in the parent to be in the initialiser for the child. It will then use `super` to refer to the parents properties and initialise them. For example:

``` swift
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
```

As you can see, when creating the `teslaX` object, both properties need to be defined. They are processed by the child class (`Car`) and any that use `super.` instead of `self.` are passed to the parent (aka super) class.

If `isElectric` had a default value assigned to it in the `Vehicle` class, the `Car` class would not need to have it added to it's initialiser. Also, if a default value was set in the childs initialiser, the code for the initialiser can have the `isElectric: Bool` removed so it would look like this:

``` swift
class Car: Vehicle {
    let isConvertible: Bool

    init(isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: false)
    }
}
```

## Copying Classes

When copying objects, they share the same data as classes are reference datatype. This means if you make changes to one copy, it changes the underlying data that is accessed by all the copies and therefore the changes are applied to all copies. For example:

``` swift
class User {
    var username = "Anonymous"
}

var user1 = User()
print(user1.username) // prints Anonymous

var user2 = user1
user2.username = "Taylor"

print(user2.username) // prints Taylor
print(user1.username) // prints Taylor
```

You can do a full copy using a method inside the class. For example:

``` swift
class User {
    var username = "Anonymous"

    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}
```

## De-initialisers

De-initialisers are called by the system when all copies of a class / object are destroyed.

A few points to be aware of:

1. Just like initialisers, you don’t use func with deinitialisers – they are special.
2. Deinitialisers can never take parameters or return data, and as a result aren’t even written with parentheses.
3. Your deinitialiser will automatically be called when the final copy of a class instance is destroyed. That might mean it was created inside a function that is now finishing, for example.
4. We never call deinitialisers directly; they are handled automatically by the system.
5. Structs don’t have deinitialisers, because you can’t copy them.

An example:

``` swift
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

// Create three objects and add them to the users array:
for i in 1...3 {
    let user = UserDeInt(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll() // As each item in the array is removed, the deinit runs.
print("Array is clear!")
```

## Working With Variables Inside Classes

In short, if you create an object from a class as a constant and it has variable properties inside that object, you can change them. The name of the object cannot change if it's a constant and neither can a constant property of the object. 

This is the opposite of a struct that cannot change anything if it is assigned to a constant.

Also, methods don't need to be marked as `mutating` inside a class.

