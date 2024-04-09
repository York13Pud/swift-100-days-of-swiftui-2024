//

import SwiftData
import SwiftUI

struct AddView: View {

    // When called, this will close the sheet with AddView on it:
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext

    @State private var name: String = ""
    @State private var type: String = "Personal"
    @State private var amount: Double = 0.0
    
    let types = ["Business", "Personal"]

//    var expenses: Expenses
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)

                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                // Challenge: Change currency to users currency:
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save Expense") {
                    // This will save an item to the expenses array:
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    modelContext.insert(item)
                    
                    // Close the AddView sheet:
                    dismiss()
                    
                }
            }
        }
    }
}

#Preview {
    AddView()
}
