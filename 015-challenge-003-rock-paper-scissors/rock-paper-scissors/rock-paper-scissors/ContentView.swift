//
//  ContentView.swift
//  rock-paper-scissors
//
//  Created by Neil Allwood on 01/02/2024.
//

// A view modifier and extension to style a player option button:
struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 110, height: 130)
            .foregroundStyle(.gray)
            .background(.thinMaterial)
            .clipShape(.rect(cornerRadius: 10))
            .shadow(radius: 12)
    }
}

extension View {
    func buttonStyle() -> some View {
        modifier(ButtonStyle())
    }
}

import SwiftUI

struct ContentView: View {
    
    var moves = [
        "rock": "✊",
        "paper": "✋",
        "scissors": "✌️"
    ].sorted(by: {$0.value < $1.value}) // Converted to an array of tuples and maintains the order
    
    @State private var appScore: Int = 0
    @State private var playerScore: Int = 0
    
    @State private var appChoice: String = ""
    @State private var playerChoice: String = ""
    
    @State private var roundsPlayed: Int = 1
    
    var body: some View {

        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purple, .cyan]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    ForEach(moves, id: \.key) { key, value in
                        Button {
                            buttonPressed()
                        } label: {
                            VStack {
                                Text("\(value)")
                                    .font(.system(size: 70))
                                Text("\(key.capitalized)")
                                    .font(.title)
                            }
                        }
                        .buttonStyle()
                        
                        Spacer()
                    }
                }
            }
        }
    }
    
    // Program logic goes here:
    func buttonPressed() {
        appChoice = moves[Int.random(in: 0...2)].key

    }
    
    func nextRoundOrGameOver() {
        
    }
    
    func restartGame() {
        
    }
    
}

#Preview {
    ContentView()
}
