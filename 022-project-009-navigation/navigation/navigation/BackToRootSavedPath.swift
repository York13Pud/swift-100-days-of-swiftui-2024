// This demo will show how to get back to the root screen when you have traversed
// through several screens.
//
// Additionally, this example will save the paths that have been navigated through
// to local storage so that when the app is closed and then reopended, it will go
// back to the last screen it was on.

import SwiftUI

@Observable
class PathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }

    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")

    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }

        // Still here? Start with an empty path.
        path = NavigationPath()
    }

    func save() {
        do {
            guard let representation = path.codable else { return }
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}

struct DetailViewSaved: View {
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

struct BackToRootSavedPath: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            // Show the DetailView and bind it to path
            DetailViewSaved(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i, path: $path)
                }
        }
    }
}

#Preview {
    BackToRoot()
}
