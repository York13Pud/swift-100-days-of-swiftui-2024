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

Within a protocol, you can also add methods. When you do so, you also must specify if they are read-only (`get`) or writable (`set`). They also cannot have any default values assigned to them and must have a type annotation assigned.

For example:

``` swift
protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set } // read and write

    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}
```

Lastly, you can specify multiple protocols for something to conform to by separating them with a `,`.

## Opaque Return Types

1. Opaque return types allow a function to return a sub-type of the declared type, so `func random_number() -> some Equitable` can be read and interpret as it returns *some* kind of Equitable.
2. Allowing to return a sub-type of generic type, might support program reasoning when the characteristics of the generic type is sufficient, while Swift compiler can take care the nuance of the sub-type in compilation checking.

The best example of an opaque return type would be the SwiftUI `View` protocol. When using this for the preview in Xcode, it has `some View` in there which will allow any elements that conform to the `View` protocol, such as a navbar at the bottom to be returned. The below code is common in iOS Xcode projects when you first create one:

``` swift
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

## Protocol Extensions

Protocol extensions allow you to add additional functionality to an existing protocol. For example, let's add an `isNotEmpty` extension to the `Array` protocol:

``` swift
extension Array {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}
```

In the above example, the `isNotEmpty` method is defined in the extension and can be used on any array in the application it is part of. If you wanted it to apply to other data structures, such as dictionaries and sets, you have two options:

1. Create the same extension for the data structure. Or
2. Given that the `Array` protocol is a member of the `Collection` protocol, along with dictionaries and sets, you can create the extension on `Collection` and it will apply to anything that conforms to that protocol.