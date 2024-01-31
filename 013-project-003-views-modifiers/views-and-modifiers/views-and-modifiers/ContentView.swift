//
//  ContentView.swift
//  views-and-modifiers
//
//  Created by Neil Allwood on 30/01/2024.
//

import SwiftUI

// View composition example (Basically, create a pre-formatted text box that can be reused):
struct CapsuleText: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}

// Custom modifier example:
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.purple)
            .clipShape(.rect(cornerRadius: 10))
    }
}
// Create an extension to the "View" protocol to create a custom modifier from "Title":
extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

// Tip: Often folks wonder when it’s better to add a custom view modifier versus
// just adding a new method to View, and really it comes down to one main reason:
// custom view modifiers can have their own stored properties, whereas extensions to View cannot.


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
        
        // View composition example:
        CapsuleText(text: "Hello")
        CapsuleText(text: "World!")
        
        // Custom modifier example:
        Text("Custom")
            .titleStyle()
    }
}

#Preview {
    ContentView()
}
