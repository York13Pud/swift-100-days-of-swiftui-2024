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

// This is used for a Codable / JSONEncoder example:
struct UserCodable: Codable {
    let firstName: String
    let lastName: String
}

struct ContentView: View {
    @State private var user = User()
    
    // These two are used for saving list items that are used on the sheet:
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    // This is used to show or hide the sheet:
    @State public var showingSheet = false
    
    // These two vars are use for UserDefaults and AppStorage on the device:
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    @AppStorage("tapCountAppStorage") private var tapCountAppStorage = 0
    
    //
    @State private var codableUser = UserCodable(firstName: "John", lastName: "Smith")
    
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
                
                Button("Save User") {
                    let encoder = JSONEncoder()

                    if let data = try? encoder.encode(codableUser) {
                        UserDefaults.standard.set(data, forKey: "UserData")
                    }
                }
                
                // Adds one to tapCount and shows the value from the UserDefaults "Tap" key:
                Button("Tap count: \(tapCount)") {
                    tapCount += 1
                    UserDefaults.standard.set(self.tapCount, forKey: "Tap")
                }
                
                // Does the same as the above but uses AppStorage instead:
                Button("Tap count: \(tapCountAppStorage)") {
                    tapCountAppStorage += 1
                }
                
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
