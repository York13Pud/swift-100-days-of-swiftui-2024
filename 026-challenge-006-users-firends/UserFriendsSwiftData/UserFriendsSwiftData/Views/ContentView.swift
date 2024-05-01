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

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query(sort: [
        SortDescriptor(\User.isActive, order: .reverse),
        SortDescriptor(\User.name)
    ]) private var users: [User]
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink(value: user) {
                    UserRowView(userRow: user)
                }
            }
            .scrollContentBackground(.hidden)
            .navigationTitle("FriendFace")
            .navigationDestination(for: User.self) { user in
                UserDetailView(user: user)
            }
            
            .overlay {
                if users.isEmpty {
                    ContentUnavailableView(label: {
                        Label("No Users Found", systemImage: "list.bullet.rectangle.portrait")
                    }, description: {
                        Text("No user data could be found")
                    }, actions: {
                        Button("Get Users") { Task { await fetchUsers() } }
                            .foregroundStyle(.blue)
                    })
                }
            }
            
            // Uncomment the below three lines to have the data load when the view is loaded:
            //.task {
            //    await fetchUsers()
            //}
 
        } .tint(.white) // Sets the navbar buttons to white:
    }
    
    // Setup the theme for the navbar:
    init() {
        navBarSettings()
    }
    
    func fetchUsers() async {
        // Check to see if the users array is empty. If so, stop.
        guard users.isEmpty else {
            return
        }
        
        do {
            // Create the URL to use:
            let url = URL(string: dataSourceURL)!
            
            // Make a call to the url to collect the JSON file:
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Build a decoder and then set the date format:
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            // Decode the data:
            let returnedUsers = try decoder.decode([User].self, from: data)
            
            // Specify a context to use to insert the data into:
            let insertContext = ModelContext(modelContext.container)
            
            // Insert the data into the context:
            for user in returnedUsers {
                insertContext.insert(user)
            }
            
            // Save the data in the context to the database tables:
            try insertContext.save()
            
        // Print an error in the console if it cannot process the data:
        } catch {
            debugPrint("Invalid data")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: User.self, inMemory: true)
}
