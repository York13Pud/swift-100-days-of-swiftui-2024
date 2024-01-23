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
    @State private var tipPercentage: Int = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    var body: some View {
        Form {
            Section {
                TextField("Aount", 
                          value: $checkAmount,
                          format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                )
                .keyboardType(.decimalPad) // Sets the keyboard type to a number pad on appear
            }
            
            Section {
                Text(checkAmount,
                     format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                )
            }
        }
    }
}

#Preview { // This is a macro
    ContentView()
}
