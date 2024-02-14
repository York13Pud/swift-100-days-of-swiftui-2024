//

import SwiftUI

// Define a struct that has the properties for each expense:
struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

// Define a class with one property that has an array of ExpenseItems
@Observable
class Expenses {
    // Setup the initial array:
    var items = [ExpenseItem]() {
        // Check if there is any data to save:
        didSet {
            // Encode the data into to a JSON format:
            if let encoded = try? JSONEncoder().encode(items) {
                // Save the data in the array to UserDefaults with a key of "Items":
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    // Initialise the class and check if there is any data in the "Items" key in UserDefaults:
    init() {
        // In this part, it will check for the "Items" key in UserDefaults storage:
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            // If it is found, it will then try to decode the contents:
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                // And then populate the items arrays with the contents:
                items = decodedItems
                return
            }
        }
        // If the key cannot be found, it will just set the items array to be an empty array:
        items = []
    }
}

struct ContentView: View {
    // Create an instance of Expenses:
    @State private var expenses = Expenses()
    
    // Used to show or hide the AddView sheet:
    @State private var showingAddExpense: Bool = false
    
    var body: some View {
        NavigationStack {
            // Display a list for the expenses:
            List {
                ForEach(expenses.items, id: \.id) { item in
                    // Show the name, category and value:
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }

                        Spacer()
                        // Challenge: Change currency to users currency:
                        Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }                }
                // Add a delete option to each list item:
                .onDelete(perform: removeItems)
                
                // Another option to do the ForEach loop with a little less code.
                // The loop will know that the list item has an identifiable id by default:
                // ForEach(expenses.items) { item in
                //     Text(item.name)
                // }
                // .onDelete(perform: removeItems)
                
            }
            .navigationTitle("iExpense")
            // Add a button to the navigation toolbar to add an item to the list
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    // Show the AddView sheet
                    showingAddExpense = true
                    // let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                    // expenses.items.append(expense)
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                // Use the AddView in the sheets content:
                AddView(expenses: expenses)
            }
        }
        
    }
    // Define a function to preform the deletion of an item in the list:
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
