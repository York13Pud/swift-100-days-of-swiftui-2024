# Protocols And Extensions

## Protocols

Protocols are essentially blueprints that provide a new type that something like a struct or class must conform to. For example:

``` swift
protocol Vehicle {
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}
```

In the above example, the `Vehicle` protocol defines two methods. Each method cannot have a body as that is defined in whatever is conforming to that protocol.

In the `Car` struct, it conforms to the `Vehicle` protocol and as such has both methods defined within it. The struct has an additional method called `openSunroof` which is not part of the `Vehicle` protocol. This is okay as you can add beyond the protocol but whatever the protocol defines, you must have it present.

Within a protocol, you can also add methods. When you do so, you also must specify if they are read-only (`get`) or writable (`set`). They also cannot have any default values assigned to them. 

For example:

``` swift
protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}
```