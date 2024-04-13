//
// Scope:
//
// 1. Download JSON file from https://www.hackingwithswift.com/samples/friendface.json
//
// 2. Parse data into User and Friends classes / structs. Ignore tags for now.
//
// 3. Add users to an array. Load the
//
// 3. Show a list of users. Filter for active / inactive users.
//
// 4. Create view that shows the users details when pressed.


import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
