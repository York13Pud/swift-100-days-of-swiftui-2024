//
//  ContentView.swift
//  project-001-wesplit
//
//  Created: 21/01/2024.
//

import SwiftUI

struct ContentView: View {
    // Define the required variables and constants:
    @State private var checkAmount: Double = 0.0
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage: Double = 10
    
    @FocusState private var amountIsFocused: Bool
    
    // let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Array<Double> {
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(tipPercentage)

        let tipValue: Double = checkAmount / 100 * tipSelection
        let grandTotal: Double = checkAmount + tipValue
        let amountPerPerson: Double = grandTotal / peopleCount

        return [tipValue, grandTotal, amountPerPerson]
    }
    
    var body: some View {
        NavigationStack {
            
            Form {
                
                Section("Bill Amount") {
                    HStack {
                        Text("Enter Bill Amount")
                            .frame(maxWidth: .infinity,
                                   alignment: .leading)
                        TextField("Amount",
                                  value: $checkAmount,
                                  format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                        )
                        .keyboardType(.decimalPad) // Sets the keyboard type to a number pad on appear
                        .focused($amountIsFocused)
                        .multilineTextAlignment(.trailing)
                    }
                }
                
                Section("Split The Bill Between") {
                    Picker("Number Of People", selection: $numberOfPeople) {
                        ForEach(1..<100, id: \.self) {
                            if $0 == 1 {
                                Text("\($0) Person")
                            } else {
                                Text("\($0) People")
                            }
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("Select The Tip Amount") {
                    // Picker("Tip Percentage", selection: $tipPercentage) {
                    //    ForEach(tipPercentages, id: \.self) {
                    //        Text($0, format: .percent)
                    //    }
                    // }
                    // .pickerStyle(.segmented)
                    
                    Slider(value: $tipPercentage, in: 0...100, step: 5)
                    
                    Text("\(Int(tipPercentage))%")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
               
                Section("Total") {
                    
                    HStack {
                        Text("Tip Amount")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(totalPerPerson[0],
                             format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                        ).frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    
                    HStack {
                        Text("Bill Amount")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(totalPerPerson[1],
                             format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                        ).frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
                
                Section() {
                
                    HStack {
                        Text("Each Person Pays")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(totalPerPerson[2],
                             format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                        )
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }.foregroundColor(.accentColor)
    
                }
            }
            .navigationBarTitleDisplayMode(.automatic)
            .navigationTitle("WeSplit")
            .toolbar {
                // Add button to hide the keyboard. Shows up in the top right.
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview { // This is a macro
    ContentView()
}
