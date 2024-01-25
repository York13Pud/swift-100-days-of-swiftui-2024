//
//  ContentView.swift
//  temp-converter
//
//  Created by Neil Allwood on 25/01/2024.
//

import SwiftUI

struct ContentView: View {
    // Define required vars and lets:
    @State private var temp: Double = 0.0
    @State private var tempFrom: String = "Celsius"
    @State private var tempTo: String = "Fahrenheit"
    
    @FocusState private var isFocused: Bool
    
    private let tempUnits: Array<String> = ["Celsius", "Fahrenheit", "Kelvin"]
    
    private var tempResult: Double {
            
        if tempFrom == "Celsius" && tempTo == "Fahrenheit" {
            let convertedValue = (temp * 9/5) + 32
            return convertedValue
            
        } else if tempFrom == "Celsius" && tempTo == "Kelvin" {
            let convertedValue = temp + 273.15
            return convertedValue
            
        } else if tempFrom == "Fahrenheit" && tempTo == "Celsius" {
            let convertedValue = (temp - 32) * 5/9
            return convertedValue
            
        } else if tempFrom == "Fahrenheit" && tempTo == "Kelvin" {
            let convertedValue = (temp - 32) * 5/9 + 273.15
            return convertedValue
            
        } else if tempFrom == "Kelvin" && tempTo == "Celsius" {
            let convertedValue = temp - 273.15
            return convertedValue
            
        } else if tempFrom == "Kelvin" && tempTo == "Fahrenheit" {
            let convertedValue = (temp - 273.15) * 9/5 + 32
            return convertedValue
            
        } else {
            return 0.0
            
        }
        
    }
    
    var body: some View {
        NavigationStack {
            
            Form {
                
                Section("Convert") {
                    HStack {
                        Text("Temperature (°\(tempFrom.first?.description ?? ""))".capitalized)
                            .frame(maxWidth: .infinity,
                                   alignment: .leading)
                        TextField("Temperature)",
                                  value: $temp,
                                  format: .number)
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                    }
                }
                
                Section("From") {
                    Picker("From", selection: $tempFrom) {
                        ForEach(tempUnits, id: \.self) {
                            if $0 != tempTo {
                                Text($0)
                            }
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("To"){
                    Picker("To", selection: $tempTo) {
                        ForEach(tempUnits, id: \.self) {
                            if $0 != tempFrom {
                                Text($0)
                            }
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Converting") {
                    HStack {
                        Text("\(tempFrom) To \(tempTo) is".capitalized)
                            .frame(maxWidth: .infinity,
                                   alignment: .leading)
                            .foregroundStyle(Color.accentColor)
                        
                        Text("\(tempResult, specifier: "%.2f")°\(tempTo.first?.description ?? "")")
                            .multilineTextAlignment(.trailing)
                            .foregroundStyle(Color.accentColor)
                    }
                }
                
            }
            .navigationTitle("Temp Converter")
            .navigationBarTitleDisplayMode(.automatic)
            
            // Show a Done button on the decimal keyboard in the top right:
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
            
        }
        
    }
    
}

#Preview {
    ContentView()
}
