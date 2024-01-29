//
//  ContentView.swift
//  guess-the-flag
//
//  Created by Neil Allwood on 29/01/2024.
//

import SwiftUI

struct ContentView: View {
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            
            Color.gray
            
            VStack(spacing: 30) {
                
                VStack {
                    Text("Tap the flag of".capitalized)
                    Text(countries[correctAnswer])
                }
                .foregroundStyle(.white)
                .padding()
                
                ForEach(0..<3) { number in
                    Button {
                        // Code for button when tapped
                    } label: {
                        Image(countries[number])
                    }
                }
            }
        } .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
