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
    @Query var users: [User]
    @Query var friends: [Friend]

//    @Query(filter: #Predicate<Friend> { friend in
//        friend.name == "John Smith"
//    }) var johnSmith: [Friend]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(users) {user in
                    Text(user.name)
                }
            }
            .navigationTitle("Users and Friends")
            .toolbar {
                Button("Show DB Path") {
                    print(modelContext.sqliteCommand)
                }
                
                Button("Add Data", systemImage: "plus") {

//                    let newFriend1 = Friend(id: UUID(), name: "John Smith")
//                    modelContext.insert(newFriend1)
//                    
//                    let newFriend2 = Friend(id: UUID(), name: "Jane Smith")
//                    modelContext.insert(newFriend2)
 
//                    print(johnSmith.first?.name ?? "Error")
                    let newUser = User(id: UUID(), isActive: true, name: "Joe Blogs", age: 40, company: "Joe Co.", email: "joe@joe.com", address: "Address", about: "About", registered: .now, friends: [])
                    modelContext.insert(newUser)
                    
//                    newUser.friends.append(friends.first?)
//                    newUser.friends.append(newFriend2)
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: User.self, inMemory: true)
}
