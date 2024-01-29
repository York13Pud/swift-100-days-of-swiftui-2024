//
//  ContentView.swift
//  guess-the-flag
//
//  Created by Neil Allwood on 29/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var countries: Array<String> = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
    @State private var correctAnswer: Int = Int.random(in: 0...2)
    
    // Vars for the score alert:
    @State private var showingScore: Bool = false
    @State private var scoreTitle: String = ""
    
    var body: some View {
        ZStack {
            // Set background colour:
            LinearGradient(colors: [.purple, .mint], startPoint: .top, endPoint: .bottom)

            VStack(spacing: 30) {
                
                VStack {
                    Text("Tap the flag of:".capitalized)
                        .font(.subheadline.weight(.heavy))
                    
                    Text(countries[correctAnswer])
                        .font(.largeTitle.weight(.semibold))
                }
                .foregroundStyle(.white)
                .padding()
                
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        // Image will get the image from the asset library that matches the name provided below:
                        Image(countries[number])
                            .clipShape(.capsule)
                            .shadow(radius: 5)
                    }
                }
            }
        } 
        .ignoresSafeArea()
        
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your Score Is: XXXXX")
        }
        
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
