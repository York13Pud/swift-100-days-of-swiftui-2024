//
//  ContentView.swift
//  views-and-modifiers
//
//  Created by Neil Allwood on 30/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    
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
    }
}

#Preview {
    ContentView()
}
