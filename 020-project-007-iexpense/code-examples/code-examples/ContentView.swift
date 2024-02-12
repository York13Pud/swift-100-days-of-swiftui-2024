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

    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        VStack {
            NavigationStack {
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
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
