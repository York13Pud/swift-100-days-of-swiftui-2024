# Project One - WeSplit

## SwiftUI Project Structure

Default files created when starting a new app:

- WeSplitApp.swift - Stores code for launching the app.
- ContentView.swift - Stores the UI code for the app.
- Assets.xcassets is an asset catalogue to store things such as images.

Basics of the ContentView.swift file:

``` swift
import SwiftUI // Import the SwiftUI framework.

struct ContentView: View { // Create a struct called ContentView that conforms to the View protocol.
    var body: some View { // Create a var called body that is required in the View protocol.
                          // some View is used to indicate that a type conforms with a protocol, but the exact conformance is not specified
        VStack { // A vertical stack to stack items inside it vertically.
            Image(systemName: "globe") // Show an image called globe.
                .imageScale(.large) // Make it a large image.
                .foregroundColor(.accentColor) // Set the colour.
            Text("Hello, world!") // A text area that says Hello, world!
        }
        .padding() // Add some padding to the VStack. This is called a modifier.
    }
}

// This section is used to render a preview in the preview area (canvas) next to the code editor.
#Preview { // This is a macro
    ContentView()
}
```

Note: opt+cmd+p to refresh the canvas area.

## Creating Forms

SwiftUI has a view type called Form to create forms.

You can add a maximum of ten (10) items to a form. More that that requires them to be put into groups or sections. This is a limitation of SwiftUI.

Groups does not modify the layout of the elements on the screen.
Sections does split things up, similar to the way a settings or preferences window would have.

## NavigationView

Use the NavigationView to add a title area to a form to stop it from scrolling into the safe area at the top of the screen. For example:

``` swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationView {
                Form {                    
                    Section {
                        Text("Hello, world!")
                        Text("Hello, world!")
                    } header: {
                        Text("This is another header")
                    } footer: {
                        Text("Here is a footer of text")
                    }
                }
                .navigationTitle("SwiftUI")
            }
        }
        .padding()
    }
}
```

Note: The `.navigationTitle` modifier has to be attached to the `Form`, not the `NavigationView`.

## Modifying App State

If you need to modify a var that is part of of a ContentView struct, it won't let you as it might be created as a constant. We can't use `mutating` either. The work around for this is to use a wrapper function called `@State`. For example:

``` swift
import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0 // Without @State, the count will not increase when the button is pressed.
                                    // In face, the app won't even compile / run.
    
    var body: some View {
        Button("Tap Count \(tapCount)") { // On tap, update tapCount and update the text inside the button.
            tapCount += 1
        }
    }
}
```

States are also only stored inside the view and as such are destroyed when the view is closed. One recommendation is to make any `@State vars / lets` as `private`.

## Binding State To User Interface Controls

A two way binding is required when you need to read a property as well as write to it at the same time. For example, a text field that allows you to enter some text that is set to store its value in a var called name:

``` swift
import SwiftUI

struct ContentView: View {
    @State private var name = ""
    
    var body: some View {
        VStack {
            Form {
                TextField("Enter your name", text: $name)
                Text("Your name is \(name)")
            }
        }
        .padding()
    }
}

```

The main difference here is the `$name` in the `TextField`. The `$` implies that this is a two-way binding. Without it, the app will not run. When you reference back to the value of `name` in the `Text` box, it only needs the name of the variable as it does not write to it, only reads it.

## Creating Views In A Loop

SwiftUI gives us a dedicated view type for this purpose, called ForEach. This can loop over arrays and ranges, creating as many views as needed. Even better, ForEach doesn’t get hit by the 10-view limit that would affect us if we had typed the views by hand.

ForEach will run a closure once for every item it loops over, passing in the current loop item. For example, if we looped from 0 to 100 it would pass in 0, then 1, then 2, and so on.

For example, this creates a form with 100 rows:

``` swift
Form {
    ForEach(1..<11) { number in // Create 10 rows 1 - 10. 11 is skipped due to the <.
        Text("Row \(number)")
    }
    // Or it can be written short hand:
    ForEach(0 ..< 11) {
        Text("Row \($0)")
    }
}
```

## Misc

The following line of text will create a `TextField` with a placeholder of `Amount`. It uses a two-way binding with `$checkAmount` that is in the `format` of a `currency`. It gets the currency `code` to use from the system settings (`Locale.current?.identifier`) and defaults to USD if it is not set (`?? "USD"`).

Lastly, the `.keyboardType(.decimalPad)` modifier is used to set the on-screen keyboard to display a numberpad with a decimal point view, instead of the standard alpha-numeric keyboard view.

``` swift
TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current?.identifier ?? "USD"))
.keyboardType(.decimalPad)
```
