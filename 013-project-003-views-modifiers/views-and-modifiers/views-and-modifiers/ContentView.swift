//
//  ContentView.swift
//  views-and-modifiers
//
//  Created by Neil Allwood on 30/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    
    // A simple view property example:
    let calcText: Text = Text("1 + 2 is:")
                             .foregroundStyle(.orange)
    
    // Computed View property example:
    var calculation: some View {
        let add: Int = 1 + 2
        
        return Text("\(add)")
                   .foregroundStyle(.red)
    }
    
    // Or you could combine both into a stack or group:
    var calculationStack: some View {
        VStack {
            Text("1 + 2 is:")
                .foregroundStyle(.blue)

            let add: Int = 1 + 2
            
            Text("\(add)")
                .foregroundStyle(.purple)
        }
    }
    
    
    var body: some View {
        // Conditional modifier example:
        VStack {
            Button("Hello World! \(String(useRedText))") {
                useRedText.toggle()
            }
            // Use a ternary operator to check if true or false and set the font colour as such:
            .foregroundColor(useRedText == true ? .red : .green)
        }
        
        // Environment modifier example:
        VStack {
            Text("Goodbye")
                .font(.largeTitle) // This will override the environment modifier. Not all
                                   // modifiers can override the environment modifier.
            Text("Goodbye")
            Text("Goodbye")
        }
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/) // This is an environment modifier. A better way to think
                      // of it is as a container modifier.
        
        // View property example:
        calcText
        calculation
        calculationStack
    }
}

#Preview {
    ContentView()
}
