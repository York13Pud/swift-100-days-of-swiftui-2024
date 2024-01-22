//
//  ContentView.swift
//  project-001-wesplit
//
//  Created: 21/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0 // @state is a property wrapper to allow for the value to change. Make it private so that it is only used in this struct (Apple recommendation).
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("Hello World")
                }
                
                Section {
                    Text("Hello World")
                    Text("Hello World")
                    Text("Hello World")
                }
                
                Button("Tap Count \(tapCount)") {
                    tapCount += 1
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
