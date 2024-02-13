//

import SwiftUI

// Define a struct that has the properties for each expense:
struct ExpenseItem {
    let name: String
    let type: String
    let amount: Double
}

// Define a class with one property that has an array of ExpenseItems
@Observable
class Expenses {
    var items = [ExpenseItem]()
}

struct ContentView: View {
    // Create an instance of Expenses:
    @State private var expenses = Expenses()
    
    var body: some View {
        NavigationStack {
            // Create a list for the expenses:
            List {
                ForEach(expenses.items, id: \.name) { item in
                    Text(item.name)
                }
                // Add a delete option to each list item:
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            // Add a button to the navigation toolbar to add an item to the list
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                    expenses.items.append(expense)
                }
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
