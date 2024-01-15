import Cocoa

class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("woof woof")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
    
    func speak() {
        print("meow")
    }
}

final class Corgi: Dog {
    override func speak() {
        print("woof woof")
    }
}

final class Poodle: Dog {
    override func speak() {
        print("woof woof")
    }
}

final class Persian: Cat {
    override func speak() {
        print("meow")
    }
}

final class Lion: Cat {
    override func speak() {
        print("meow")
    }
}

let dogOne = Corgi(legs: 4)
dogOne.speak()

let catOne = Persian(isTame: true)
catOne.speak()
print("Is this cat tame? \(catOne.isTame)")
