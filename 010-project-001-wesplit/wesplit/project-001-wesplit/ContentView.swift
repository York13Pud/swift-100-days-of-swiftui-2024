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
    @State private var tipPercentage: Int = 10
    
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(tipPercentage)

        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray
                     .ignoresSafeArea()
                
                VStack {
                    
                    Divider()
                        .background(Color.gray)
                    
                    Form {
                        
                        Section {
                            TextField("Aount",
                                      value: $checkAmount,
                                      format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                            )
                            .keyboardType(.decimalPad) // Sets the keyboard type to a number pad on appear
                            .focused($amountIsFocused)
                            
                            Picker("Number Of People", selection: $numberOfPeople) {
                                ForEach(2..<100, id: \.self) {
                                    Text("\($0) People")
                                }
                            }
                            .pickerStyle(.navigationLink)
                        }
                        
                        Section {
                            Picker("Tip Percentage", selection: $tipPercentage) {
                                ForEach(tipPercentages, id: \.self) {
                                    Text($0, format: .percent)
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        
                        Section {
                            Text(totalPerPerson,
                                 format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                            )
                        }
                    }
                    .navigationBarTitleDisplayMode(.automatic)
                    .navigationTitle("WeSplit")
                    .toolbar {
                        // Add button to hide the keyboard. Shows up in the top right.
                        if amountIsFocused {
                            Button("Done") {
                                amountIsFocused = false
                            }.foregroundColor(.white)
                        }
                        
//                        ToolbarItem(placement: .principal) {
//                            VStack {
//                                Text("WeSplit")
//                                    .font(.title)
//                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                                    .foregroundStyle(Color.white)
//                            }
//                        }

                    }
                }
            }
        }
    }
}

#Preview { // This is a macro
    ContentView()
}
