//

import SwiftUI

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

@Observable
class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct ContentView: View {
    @State public var showingSheet = false
    @State private var user = User()

    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")

            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
            
            Button("Show Sheet") {
                            showingSheet.toggle()
                        }
                        .sheet(isPresented: $showingSheet) {
                            SecondView(name: user.firstName)
                        }
        }
    }
}

#Preview {
    ContentView()
}
