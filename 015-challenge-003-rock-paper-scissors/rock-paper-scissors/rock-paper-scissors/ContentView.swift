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

// A View composition for each player option button:
struct PlayerChoiceButton: View {
    let symbol: String
    let text: String
    
    var body: some View {
        Button {
            print(" ")
        } label: {
            VStack {
                Text("\(symbol)")
                    .font(.system(size: 70))
                Text("\(text.capitalized)")
                    .font(.title)
            }
        }
        .buttonStyle()
        
        Spacer()
    }
}

import SwiftUI

struct ContentView: View {
    
    private var moves = [
        "paper": "✋",
        "rock": "✊",
        "scissors": "✌️"
    ]
    
    @State private var appScore: Int = 0
    @State private var playerScore: Int = 0
    
    @State private var appChoice: String = ""
    @State private var playerChoice: String = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purple, .cyan]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    ForEach(moves.sorted(by: <), id: \.key) { key, value in
                        PlayerChoiceButton(symbol: value, text: key)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
