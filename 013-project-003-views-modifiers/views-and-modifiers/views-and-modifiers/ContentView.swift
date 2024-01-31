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
        Button("Hello World! \(String(useRedText))") {
            useRedText.toggle()
        }
        // Use a ternary operator to check if true or false and set the font colour as such:
        .foregroundColor(useRedText == true ? .red : .green)
        
    }
}

#Preview {
    ContentView()
}
