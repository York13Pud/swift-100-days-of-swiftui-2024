// Times Table Game

import SwiftUI

struct ContentView: View {
    @State private var timesTableSelected: Int = 2
    @State private var timesTableMultiplier: Int = 1
    
    @State private var questionsToAsk: Double = 5
    @State private var questionsAsked: Int = 1
    
    @State private var playerAnswer: Int = 0
    @State private var playerScore: Int = 0
    
    @FocusState private var answerIsFocused: Bool
    
    var body: some View {
        NavigationStack {

            // 1. Add a method to select which times table to use, between 2 and 12.
            //    Buttons, slider or drop-down.
            Form {
                
                List {
                    // To-Do: Once game starts, disable
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
                    
                    Section("Question \(questionsAsked) of \(Int(questionsToAsk))") {
                        HStack {
                            Text("What is \(timesTableSelected) x \(timesTableMultiplier)")
                            TextField("", value: $playerAnswer, format: .number)
                                .keyboardType(.decimalPad) // Sets the keyboard type to a number pad on appear
                                .focused($answerIsFocused)
                                .multilineTextAlignment(.trailing)
                            
                        }
                    }
                    
                    Section() {
                        Button() {
                            
                        } label: {
                            Text("New Game")
                                .frame(maxWidth: .infinity)
                                .foregroundStyle(.white)
                        }
                        .listRowBackground(Color.clear)
                        .buttonStyle(.borderedProminent)
                    }
                    
                    Section {
                        HStack {
                            Button() {
                                
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

                            } label: {
                                Text("Check Answer")
                                    .frame(maxWidth: .infinity)
                                    .foregroundStyle(.white)
                                
                            }
                            .listRowBackground(Color.clear)
                            .tint(.green)
                            .buttonStyle(.borderedProminent)
                            
                            
                        }
                    }.listRowBackground(Color.clear)
                
                    // Debug section for selections to see what they are:
                    Section(){
                        Text("tt selected: \(timesTableSelected)")
                        Text("tt multiplier: \(timesTableMultiplier)")
                        Text("tt answer: \(timesTableMultiplier * timesTableSelected)")
                        Text("questions to ask: \(Int(questionsToAsk))")
                        Text("questions asked: \(questionsAsked)")
                        Text("player score: \(playerScore)")
                    }
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
        
        
        // 3. Randomly generate the question.
        
        
    }
    
    func checkAnswer() {
        
    }
}

#Preview {
    ContentView()
}
