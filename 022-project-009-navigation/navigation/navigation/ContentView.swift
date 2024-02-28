// This is programatic UI navigation.
// Essentially this means that we don't have to wait for the user to press a button
// to progress.

import SwiftUI

struct ContentView: View {
    // NavigationPath allows for the storage of any datatype, rather than just one.
    @State private var path = NavigationPath()
    
    var body: some View {
        // Bind navigation stack to path as a two-way binding.
        NavigationStack(path: $path) {
            List {
                ForEach(0..<5) { i in
                    NavigationLink("Select Number: \(i)", value: i)
                }

                ForEach(0..<5) { i in
                    NavigationLink("Select String: \(i)", value: String(i))
                }
            }
            // Use these methods only when the datatype is specified:
            .navigationDestination(for: Int.self) { selection in
                Text("You selected the number \(selection)")
            }
            
            .navigationDestination(for: String.self) { selection in
                Text("You selected the string \(selection)")
            }
            .navigationTitle("Title")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                // This will set path to have an int of 556:
                Button("Push 556") {
                    path.append(556)
                }
                
                Spacer()
                
                // This will set path to have a sreing of hello:
                Button("Push Hello") {
                    path.append("Hello")
                }
            }
            // Set the toolbar background to blue and the text to white:
            .toolbarBackground(.blue)
            .toolbarColorScheme(.dark)
        }
        
    }
}

#Preview {
    ContentView()
}
