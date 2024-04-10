//
import SwiftData
import SwiftUI


struct ContentView: View {
    @Environment(\.modelContext) var modelContext
       
    // Used to show or hide the AddView sheet:
    @State private var showingAddExpense: Bool = false
    @State private var filteredExpenseType: String = "All"
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount),
    ]
    
    var body: some View {
        NavigationStack {
            ExpensesView(expenseType: filteredExpenseType, sortOrder: sortOrder)
            
            .navigationTitle("iExpense")
            
            // Add a button to the navigation toolbar to add an item to the list
            .toolbar {
                Menu("Filter", systemImage: "line.3.horizontal.decrease.circle") {
                    Picker("Filter", selection: $filteredExpenseType) {
                        Text("Show All").tag("All")
                        Text("Show Business Expenses").tag("Business")
                        Text("Show Personal Expenses").tag("Personal")
                    }
                }
                
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by Name")
                            .tag([
                                SortDescriptor(\ExpenseItem.name)
                            ])
                        
                        Text("Sort By Amount")
                            .tag([
                                SortDescriptor(\ExpenseItem.amount),
                                SortDescriptor(\ExpenseItem.name)
                            ])
                    }
                }
                
                Button("Add Expense", systemImage: "plus") {
                    // Show the AddView sheet
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                // Use the AddView in the sheets content:
                AddView()
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ExpenseItem.self)
}
