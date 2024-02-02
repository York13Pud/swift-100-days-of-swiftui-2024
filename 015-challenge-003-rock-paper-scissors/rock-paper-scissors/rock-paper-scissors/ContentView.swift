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
            .foregroundStyle(.secondary)
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
    
    @State private var gameOver: Bool = false
    @State private var gameOverMessage: String = ""
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purple, .cyan]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Text("Rock - Paper - Scissors")
                    .font(.largeTitle)
                    .foregroundStyle(.primary)
                
                Spacer()
                
                Text("Press A Button To Play")
                    .font(.title2)
                    .foregroundStyle(.primary)
                
                HStack {
                    
                    Spacer()
                    
                    ForEach(moves, id: \.key) { key, value in
                        Button {
                            playerChoice = key
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
                
                Text("Round \(roundsPlayed) of 8")
                    .font(.title2)
                    .padding()
                Spacer()
                
                HStack {
                    Spacer()
                    
                        VStack {
                            Text("Player")
                            Text("\(playerScore)")
                        }
                    
                    Spacer()
                    
                        VStack {
                            Text("Scores")
                            Text(" ")
                        }
                    
                    Spacer()
                    
                        VStack {
                            Text("Phone")
                            Text("\(appScore)")
                        }
                    
                    Spacer()
                }
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.primary)
                
            }
            .alert("Game Over", isPresented: $gameOver) {
                Button("New Game", action: restartGame)
            } message: {
                Text(gameOverMessage)
                    .foregroundStyle(.white)
            }
        }
    }
    
    // Program logic goes here:
    func buttonPressed() {
        appChoice = moves[Int.random(in: 0...2)].key
        
        if appChoice == "rock" && playerChoice == "paper" {
            playerScore += 1
        } else if appChoice == "rock" && playerChoice == "scissors" {
            appScore += 1
        } else if appChoice == "paper" && playerChoice == "scissors" {
            playerScore += 1
        } else if appChoice == "paper" && playerChoice == "rock" {
            appScore += 1
        } else if appChoice == "scissors" && playerChoice == "rock" {
            playerScore += 1
        } else if appChoice == "scissors" && playerChoice == "paper" {
            appScore += 1
        } else if playerChoice == "rock" && appChoice == "paper" {
            appScore += 1
        } else if playerChoice == "rock" && appChoice == "scissors" {
            playerScore += 1
        } else if playerChoice == "paper" && appChoice == "scissors" {
            appScore += 1
        } else if playerChoice == "paper" && appChoice == "rock" {
            playerScore += 1
        } else if playerChoice == "scissors" && appChoice == "rock" {
            appScore += 1
        } else if playerChoice == "scissors" && appChoice == "paper" {
            playerScore += 1
        } else {
            
        }
        
        // Check if last round has been played:
        if roundsPlayed != 8 {
            roundsPlayed += 1
        } else {
            if playerScore > appScore {
                gameOverMessage = "Congratulations! You Won!"
            } else if appScore > playerScore {
                gameOverMessage = "Unlucky! The phone won!"
            } else {
                gameOverMessage = "Close! This match is a draw!"
            }
            gameOver = true
        }

    }
    
    func restartGame() {
        appScore = 0
        playerScore = 0
        
        appChoice = ""
        playerChoice = ""
        
        roundsPlayed = 1
        
        gameOverMessage = ""
        gameOver = false
    }
    
}

#Preview {
    ContentView()
}
