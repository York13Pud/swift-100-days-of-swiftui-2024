//
//  ContentView.swift
//  project-001-wesplit
//
//  Created: 21/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount: Int = 0 // @state is a property wrapper to allow for the value to change. Make it private so that it is only used in this struct (Apple recommendation).
    
    @State private var name: String = ""
    
    let food = ["Pizza", "Fish n' Chips", "Kebab"]
    @State private var selectedFood = "Pizza"
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Basic Text Box") {
                    Text("Hello World")
                }
                
                Section("For Loop Text") {
//                    ForEach(1..<4) { number in // longer form closure.
//                        Text("Hello World \(number)!")
//                    }

                    ForEach(1..<4) { // Shorthand closure.
                        Text("Hello World \($0)!")
                        // Or
                        // Text("Hello World!").tag($0)
                        // If you don't want the $0 value to be shown
                    }
                }
                
                Section("For Loop Picker") {
                    Picker("Select From The Menu", selection: $selectedFood) {
                        ForEach(food, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Text Field") {
                    TextField("Enter your name", text: $name) // $ indicates that the value is a two way binding. This allows Swift to read and write changes when they happen.
                    Text("Your name is: \(name)") // You only need to call the "name" var to read it. No $ is required.
                }
                
                Section("Button") {
                    Button("Tap Count \(tapCount)") {
                        tapCount += 1
                    }
                    .listRowBackground(Color.red)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

#Preview { // This is a macro
    ContentView()
}
