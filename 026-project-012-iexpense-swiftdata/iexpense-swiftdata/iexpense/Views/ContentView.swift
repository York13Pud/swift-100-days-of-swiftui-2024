//
import SwiftData
import SwiftUI


struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    // @Environment(\.presentationMode) var presentationMode
    
    @Query(sort: [SortDescriptor(\ExpenseItem.name)]) var expenses: [ExpenseItem]
   
    // Used to show or hide the AddView sheet:
    @State private var showingAddExpense: Bool = false
    
    var body: some View {
        NavigationStack {
            // Display a list for the expenses:
            List {
                ForEach(expenses) { expense in
                    // Show the name, category and value:
                    HStack {
                        VStack(alignment: .leading) {
                            Text(expense.name)
                                .font(.headline)
                            Text(expense.type)
                        }
                        
                        Spacer()
                        // Challenge: Change currency to users currency:
                        Text(expense.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                    // Challenge: Add some formatting based on the value:
                    .foregroundStyle(expense.amount < 10 ? .blue : expense.amount < 100 ? .orange: .red)
                }
                // Add a delete option to each list item:
                .onDelete(perform: deleteExpense)
            
            }
            .navigationTitle("iExpense")
            // Add a button to the navigation toolbar to add an item to the list
            .toolbar {
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
    // Define a function to preform the deletion of an item in the list:
    func deleteExpense(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our query
            let expense = expenses[offset]

            // delete it from the context
            modelContext.delete(expense)
        }
    }
}

#Preview {
    ContentView()
}
