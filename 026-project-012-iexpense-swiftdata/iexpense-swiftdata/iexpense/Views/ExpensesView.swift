//
import SwiftData
import SwiftUI

struct ExpensesView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpenseItem]
    
    var body: some View {
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
    
    init(expenseType: String, sortOrder: [SortDescriptor<ExpenseItem>]) {
        _expenses = Query(filter: #Predicate<ExpenseItem> { expense in
            if expenseType == "All" {
                !expense.type.isEmpty
            } else {
                expense.type == expenseType
            }
        }, sort: sortOrder)
    }
}

#Preview {
    ExpensesView(expenseType: "Personal", sortOrder: [SortDescriptor(\ExpenseItem.name)])
}
