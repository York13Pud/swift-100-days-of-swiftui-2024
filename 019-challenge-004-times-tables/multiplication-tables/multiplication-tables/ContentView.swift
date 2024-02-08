// Times Table Game

import SwiftUI

struct ContentView: View {
    @State private var timesTableSelected: Int = 2
    @State private var timesTableMultiplier: Int = 1
    
    @State private var questionsToAsk: Double = 5
    @State private var questionsAsked: Int = 1
    
    @State private var playerAnswer: Int = 0
    @State private var playerScore: Int = 0
    
    @State private var answerCorrectShow: Bool = false
    @State private var answerCorrect: Bool = false

    @State private var answerButtonDisabled: Bool = false
    
    @State private var isNewGame: Bool = false
    @State private var isGameOver: Bool = false
    
    @State private var scale: Double = 1.0
    
    @FocusState private var answerIsFocused: Bool
    
    var body: some View {
        NavigationStack {

            Form {
                // Main menu
                if !isNewGame {
                    Group {
                        
                        Section("Times Table") {
                            Picker("Select Times Table", selection: $timesTableSelected) {
                                ForEach(2..<13, id: \.self) {
                                    Text("\($0) Times Table")
                                }
                            }
                            .pickerStyle(.navigationLink)
                        }
                        
                        Section("Questions") {
                            // 2. Add a method to select the number of questions to show
                            Slider(value: $questionsToAsk, in: 5...20, step: 5)
                            
                            Text("Ask \(Int(questionsToAsk)) Questions")
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                        
                        Section() {
                            
                            Button() {
                                questionsAsked = 1
                                
                                playerAnswer = 0
                                playerScore = 0
                                
                                answerCorrectShow = false
                                answerCorrect = false

                                answerButtonDisabled = false
                                
                                isNewGame = false
                                isGameOver = false
                                
                                withAnimation {
                                    isNewGame.toggle()
                                }
                                
                            } label: {
                                Text("Start Game")
                                    .frame(maxWidth: .infinity)
                                    .foregroundStyle(.white)
                            }
                            .listRowBackground(Color.clear)
                            .buttonStyle(.borderedProminent)
                        }
                    }
                }
                
                // Main game section
                else {
                    Group {
                        
                        Section("Question \(questionsAsked) of \(Int(questionsToAsk))") {
                            HStack {
                                Text("What is \(timesTableSelected) x \(timesTableMultiplier)")
                                TextField("", value: $playerAnswer, format: .number)
                                    .keyboardType(.decimalPad) // Sets the keyboard type to a number pad on appear
                                    .focused($answerIsFocused)
                                    .multilineTextAlignment(.trailing)
                            }
                        }
                    
                        Section {
                            HStack {
                                Text("Your Score Is: \(playerScore)")
                            }
                        }
                        
                        Section {
                            HStack {
                                Button() {
                                    withAnimation {
                                        isNewGame.toggle()
                                    }
                                } label: {
                                    Text("New Game")
                                        .frame(maxWidth: .infinity)
                                        .foregroundStyle(.white)
                                }
                                .listRowBackground(Color.clear)
                                .tint(.red)
                                .buttonStyle(.borderedProminent)
                                
                                
                                Spacer()
                                Spacer()
                                
                                Button() {
                                    print("Button 1a: \(answerButtonDisabled)")
                                    answerButtonDisabled.toggle()
                                    checkAnswer()
                                    print("Button 1b: \(answerButtonDisabled)")
                                    
                                } label: {
                                    Text("Check Answer")
                                        .frame(maxWidth: .infinity)
                                        .foregroundStyle(.white)
                                    
                                }
                                .listRowBackground(Color.clear)
                                .tint(.green)
                                .buttonStyle(.borderedProminent)
                                .disabled(answerButtonDisabled ? true : false)
                            }
                        }
                        .listRowBackground(Color.clear)
                    }
                    
                    if isGameOver {
                        Text("Game Over. Your Final Score Is: \(playerScore)")
                            .listRowBackground(Color.clear)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundStyle(.green)
                    }
                    
                    if answerCorrectShow {
                        if answerCorrect {
                            Text("Correct")
                                .listRowBackground(Color.clear)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .foregroundStyle(.green)
                        } else {
                            Text("Incorrect")
                                .listRowBackground(Color.clear)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .foregroundStyle(.red)
                        }
                    }
                }
                
                // Debug section for selections to see what they are:
//                Section(){
//                    Text("tt selected: \(timesTableSelected)")
//                    Text("tt multiplier: \(timesTableMultiplier)")
//                    Text("tt answer: \(timesTableMultiplier * timesTableSelected)")
//                    Text("questions to ask: \(Int(questionsToAsk))")
//                    Text("questions asked: \(questionsAsked)")
//                    Text("player answer: \(playerAnswer)")
//                    Text("player score: \(playerScore)")
//                    Text("button disabled: \(String(answerButtonDisabled))")
//                }
            }
            .navigationTitle("Times Tables")
            
        }
        .toolbar {
            // Add button to hide the keyboard. Shows up in the top right.
            if answerIsFocused {
                Button("Done") {
                    answerIsFocused = false
                }
            }
        }
    }
    
    func randomNumber() -> Int {
        return Int.random(in: 1..<13)
    }
    
    func checkAnswer() {
        let answer = timesTableSelected * timesTableMultiplier
        
        print("Button 2: \(answerButtonDisabled)")
        
        if answer == playerAnswer {
            answerCorrect = true
            answerCorrectShow = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                answerButtonDisabled = true
                answerCorrect = false
                answerCorrectShow = false
                playerScore += 1
                nextRound()
            }
            
            
        } else {
            answerCorrect = false
            answerCorrectShow = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                answerCorrect = false
                answerCorrectShow = false
                nextRound()
            }
        }
    }
    
    func nextRound() {
        if Int(questionsToAsk) == questionsAsked {
            answerButtonDisabled = true
            isGameOver = true
            
        } else {
            questionsAsked += 1
            timesTableMultiplier = randomNumber()
            
            answerButtonDisabled = false
            
            print("Button 3: \(answerButtonDisabled)")
        }
    }
    
    
}

#Preview {
    ContentView()
}
