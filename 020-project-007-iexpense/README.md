# Project 7

## Why @State Only Works With Structs

`@State` is designed to store simple state data that is local to the current view.

`@State` does not work when it is referencing a class. It will not update, for example, a text box when the value of a class property is updated via a `TextField` for example. A different method is needed. For that we use `@StateObject`

For example, the bellow will work just fine and when the text is updated, it will show immediately:

``` swift
struct User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct ContentView: View {
    @State private var user = User()

    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")

            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}
```

However, if you change `struct user` to `class user`, the text will not update in the text boxes but the data in the class properties will be updated.

## @StateObject

For a variable to be updated with with updates from a property in a class, the `@StateObject` wrapper is used instead of `@State`.

Now, this is only half the battle. Changing only that will not work on its own. In addition, the property (or properties) in the class that need to provide updates to the variable calling the class need to publish those updates. This is done using the `@Published` wrapper in front of the property. In addition, the class needs to use the `ObservableObject` protocol so that the published changes can be made visible. For example:

``` swift
class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct ContentView: View {
    @StateObject private var user = User()

    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")

            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}
```

Now, if you take `@Published` away from `lastName`, it would not update in the UI but updating `firstName` will show the updates in the UI.

Note: `@StateObject` is used when creating the object. If you are just referencing that variable later on, use `@ObservedObject` which is used for using an existing objects state, rather than rebuilding the same thing.

## Showing And Hiding A Sheet View

Sheets are views that pop up from the bottom. An example is when a pair of AirPods are discovered and are shown in at the bottom of the screen with the rest faded out. That is a sheet view. For example:

``` swift
import SwiftUI

// This view will be used for a sheet that will pop-up.
struct SecondView: View {
    @Environment(\.dismiss) var dismiss // This will be used to dismiss the sheet
    
    let name: String
    
    var body: some View {
        VStack {
            Text("Hello \(name)")
            Button("Dismiss Sheet") {
                dismiss()
            }
        }
    }
}

struct ContentView: View {
    @State public var showingSheet = false
    
    var body: some View {
        VStack {
            Button("Show Sheet") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                SecondView(name: "Fred")
            }
        }
    }
}
```

The `@Environment` property wrapper is used to get external information from the device, such as dark/light mode, system font size etc. In the above example, it is used to dismiss the sheet view as it could have been presented in a number of ways so we let the system (Environment) do it for us.

## Deleting Items Using onDelete()

The `onDelete()` modifier is used in a `List` item when you use a `ForEach` loop to allow for an item to be deleted.

A function is required to perform the delete action. For example:

``` swift
struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView {
            VStack {

                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }.onDelete(perform: removeRows)
                }
                
                Button("Add Number To List") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
                
            }.navigationTitle("Testing")
                .toolbar {
                    EditButton()
                }
            
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}
```

In the above, when the button is clicked, a value is added to an array and the value is increased by one. It then shows up in the list.

When you slide from the right to left on a list item, it will delete it.

Also, you can use the edit button to delete items in the list.

## Storing User Settings With UserDefaults

UserDefaults is used to store and retrieve data that you want to store for user settings in an app. For example, a high score on a locally played game that has no central scoreboard online.

For example:

``` swift
struct ContentView: View {

    // This will save the tap count to user defaults with a key name of "Tap":
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    // This will do the same as the above but using AppStorage instead.
    // AppStorage allows for a default value to be assigned if the key does not exist:
    @AppStorage("tapCountAppStorage") private var tapCountAppStorage = 0
    
    var body: some View {
        NavigationView {
            VStack {
                
                // Adds one to tapCount and shows the value from the UserDefaults "Tap" key:
                Button("Tap count: \(tapCount)") {
                    tapCount += 1
                    UserDefaults.standard.set(self.tapCount, forKey: "Tap")
                }
                
                // Does the same as the above but uses AppStorage instead:
                Button("Tap count: \(tapCountAppStorage)") {
                    tapCountAppStorage += 1
                }
                
            }.navigationTitle("Testing")
                .toolbar {
                    EditButton()
                }
            
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}
```

In the above, there are two methods shown for storing data. First is `UserDefaults` which has a lot of functionality to it. The second is `AppStorage` which is simpler but lacks the further customisation of `UserDefaults` and is only available for SwiftUI.

Try not to store more than 0.5MB of user settings as it can slow down the loading of the app.

There is a delay in writing data to UserDefaults. What it is exactly is unknown but it could be around two seconds.

## Archiving Swift Objects With Codable

@AppStorage is great for storing simple settings such as integers and Booleans, but when it comes to complex data – custom Swift types, for example – we need to do a little more work. This is where we need to poke around directly with UserDefaults itself, rather than going through the @AppStorage property wrapper.

Here’s a simple User data structure we can work with:

```swift 
struct User {
    let firstName: String
    let lastName: String
}
```

That has two strings, but those aren’t special – they are just pieces of text. The same goes for integer (plain old numbers), Boolean (true or false), and Double (plain old numbers, just with a dot somewhere in there). Even arrays and dictionaries of those values are easy to think about: there’s one string, then another, then a third, and so on.

When working with data like this, Swift gives us a fantastic protocol called Codable: a protocol specifically for archiving and unarchiving data, which is a fancy way of saying “converting objects into plain text and back again.”

We’re going to be looking at Codable much more in future projects, but for now we’re going to keep it as simple as possible: we want to archive a custom type so we can put it into UserDefaults, then unarchive it when it comes back out from UserDefaults.

When working with a type that only has simple properties – strings, integers, Booleans, arrays of strings, and so on – the only thing we need to do to support archiving and unarchiving is add a conformance to Codable, like this:

``` swift
struct User: Codable {
    let firstName: String
    let lastName: String
}
```

Swift will automatically generate some code for us that will archive and unarchive User instances for us as needed, but we still need to tell Swift when to archive and what to do with the data.

This part of the process is powered by a new type called JSONEncoder. Its job is to take something that conforms to Codable and send back that object in JavaScript Object Notation (JSON) – the name implies it’s specific to JavaScript, but in practice we all use it because it’s so fast and simple.

The Codable protocol doesn’t require that we use JSON, and in fact other formats are available, but it is by far the most common. In this instance, we don’t actually care what sort of data is used, because it’s just going to be stored in UserDefaults.

To convert our user data into JSON data, we need to call the encode() method on a JSONEncoder. This might throw errors, so it should be called with try or try? to handle errors neatly. For example, if we had a property to store a User instance, like this:

`@State private var user = User(firstName: "Taylor", lastName: "Swift")`

Then we could create a button that archives the user and save it to UserDefaults like this:

``` swift
Button("Save User") {
    let encoder = JSONEncoder()

    if let data = try? encoder.encode(user) {
        UserDefaults.standard.set(data, forKey: "UserData")
    }
}
```

That accesses UserDefaults directly rather than going through @AppStorage, because the @AppStorage property wrapper just doesn’t work here.

That data constant is a new data type called, perhaps confusingly, Data. It’s designed to store any kind of data you can think of, such as strings, images, zip files, and more. Here, though, all we care about is that it’s one of the types of data we can write straight into UserDefaults.

When we’re coming back the other way – when we have JSON data and we want to convert it to Swift Codable types – we should use JSONDecoder rather than JSONEncoder(), but the process is much the same.

## Working With Identifiable Items In SwiftUI

Basically, add an ID field to your data structure that uses an auto-generated UUID using UUID v4. For example:

``` swift
struct ExpenseItem: Identifiable {
    let id: UUID = UUID()
    let name: String
    let type: String
    let amount: Double
}
```

`Identifiable` is a protocol that flags to SwiftUI that this is an identifiable struct. It *MUST* have a field called `id` for it to conform to the protocol.

As the `Identifiable` protocol has been added to the struct above, a ForEach loop can be rewritten from this:

``` swift
List {
    ForEach(expenses.items, id: \.id) { item in
        Text(item.name)
    }
    .onDelete(perform: removeItems)
}
```

to this:

``` swift
List {
    ForEach(expenses.items) { item in
        Text(item.name)
    }
    .onDelete(perform: removeItems)
}
```

The `ForEach` loop will know that the struct has a unique identifier called `id` and use that by default to identify the items, rather than specifying which one to use. There is however no reason why you can't use the previous `ForEach` loop. It will work exactly the same but with a little more code.

The choice is yours!

## Making Changes Permanent With UserDefaults