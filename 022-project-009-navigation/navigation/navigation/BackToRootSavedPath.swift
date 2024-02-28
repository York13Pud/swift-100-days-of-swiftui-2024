// This demo will show how to get back to the root screen when you have traversed
// through several screens.

import SwiftUI



struct DetailView: View {
    var number: Int
    
    @Binding var path: NavigationPath

    var body: some View {
        // Create a new nav link to
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
                    // This will reset the path to be empty.
                    // An alternative would be path = path.removeAll() but requires
                    // other changes to be made as well.
                    path = NavigationPath()
                }
            }
    }
}

struct BackToRoot: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            // Show the DetailView and bind it to path
            DetailView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i, path: $path)
                }
        }
    }
}

#Preview {
    BackToRoot()
}
