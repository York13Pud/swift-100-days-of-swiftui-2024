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
    
    @State private var playerScore: Int = 0
    
    // Vars for the score alert:
    @State private var showingScore: Bool = false
    @State private var scoreTitle: String = ""
    
    var body: some View {
        ZStack {
            // Set background colour:
            //LinearGradient(colors: [.purple, .mint], startPoint: .top, endPoint: .bottom)
            RadialGradient(stops: [.init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                                   .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)],
                           center: .top, startRadius: 200, endRadius: 700)
                           .ignoresSafeArea()

            VStack {
                Spacer()
                
                Text("Guess The Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                
                Spacer()
                Spacer()
                
                VStack(spacing: 15) {
                    
                    VStack {
                        Text("Tap the flag of:".capitalized)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    .foregroundStyle(.secondary)
                    .padding()
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            // Image will get the image from the asset library that matches the name provided below:
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 12)
                        }
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()

                Text("Score: ZZZ")
                    .foregroundStyle(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.weight(.bold))

                Spacer()
            }
            
            
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your Score Is: XXXXX")
                    .foregroundStyle(.white)
            }
            .padding()
            
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
