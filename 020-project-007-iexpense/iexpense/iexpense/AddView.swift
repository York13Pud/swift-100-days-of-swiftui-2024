//

import SwiftUI

struct AddView: View {
    @State private var name: String = ""
    @State private var type: String = "Personal"
    @State private var amount: Double = 0.0
    
    let types = ["Business", "Personal"]

    var expenses: Expenses
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)

                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }

                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
