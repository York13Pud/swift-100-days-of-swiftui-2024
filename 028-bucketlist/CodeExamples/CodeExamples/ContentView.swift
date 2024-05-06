//

import SwiftUI

struct User: Comparable, Identifiable {
    let id = UUID()
    var firstName: String
    var lastName: String
    
    // This method will add a sort method that can be used to sort by lastname first.
    // lhs = left-hand side, rhs = right-hand side. static implies run inside the struct:

    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ContentView: View {

    let users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Kristine", lastName: "Kochanski"),
        User(firstName: "David", lastName: "Lister"),
    ]
    // As we have a custom sort method in the Users struct, we can simply call sorted:
        .sorted()
    
    // This method would work but at the same time, it would potentially lead to being repeated in other
    // parts of an application. A better method is to create a method in the Users struct that can handle
    // the sorting for the array once. This is done using by conforming the User struct to Comparable protocol
    // and adding a custom sort.
    //
    //    .sorted {
    //        $0.lastName < $1.lastName
    //    }

    var body: some View {
        List(users) { user in
            Text("\(user.lastName), \(user.firstName)")
        }
    }
}

#Preview {
    ContentView()
}
