import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false
    
    var body: some View {
        
        ZStack {
            // Use a linear gradient for the background
            LinearGradient(colors: [.orange, .yellow],
                           startPoint: .top,
                           endPoint: .bottom)
            
            VStack {
                
                VStack() {
                    Text("This is a")
                    Text("VStack")
                }
                .padding(50)
                .background(.ultraThinMaterial) // This adds a box behind the VStack that
                // gives a frosted glass effect.
                
                VStack {
                    // A 3 x 3 grid example using a VStack and HStacks
                    HStack(spacing: 30) {
                        Text("1")
                        Text("2")
                        Text("3")
                    }
                    .frame(minWidth: 150, maxWidth: .infinity, maxHeight: 30)
                    .background(.red.gradient)
                    .foregroundColor(.white)
                    
                    HStack(spacing: 30) {
                        Text("4")
                        Text("5")
                        Text("6")
                    }
                    .frame(minWidth: 150, maxWidth: .infinity, maxHeight: 30)
                    .background(.blue.gradient)
                    .foregroundColor(.white)
                    
                    HStack(spacing: 30) {
                        Text("7")
                        Text("8")
                        Text("9")
                    }
                    .frame(minWidth: 150, maxWidth: .infinity, maxHeight: 30)
                    .background(.green.gradient)
                    .foregroundColor(.white)
                }
                .padding()
                
                VStack {
                    
                    HStack {
                        Button("Nothing", role: .none) {}
                            .buttonStyle(.borderedProminent)
                            .tint(.green)
                        
                        Button("Something", role: .cancel) {}
                            .buttonStyle(.borderedProminent)
                        
                        // Using action means calling a function. No trailing closure required
                        Button("Delete", role: .destructive, action: executeDelete)
                            .buttonStyle(.borderedProminent)
                    }
                    HStack(spacing: 38) {
                        
                        // A fully custom button with an image in the button
                        Button {
                            print("I was edited")
                        } label: {
                            Label("Edit", systemImage: "pencil")
                                .padding()
                                .foregroundStyle(.white)
                                .background(.indigo)
                                .font(.title3)
                        }
                        
                        Button {
                            print("Alert")
                            showingAlert = true
                        } label: {
                            Label("Message", systemImage: "mail")
                                .padding()
                                .foregroundStyle(.white)
                                .background(.teal)
                                .font(.title3)
                        }
                    }

                } 
                .alert("Warning", isPresented: $showingAlert) {
                    Button("Ok", role: .destructive) {
                        print("Cleared")
                    }
                    
                    Button("Cancel", role: .cancel) {
                        print("Cancelled")
                    }
                    
                } message: {
                    Text("This message will self-destruct in five seconds!")
                }
                
            }
            
        }
        .ignoresSafeArea() // Allows the background colour to go the full height of the screen
        
    }
    
    func executeDelete() {
        print("Deleting.....")
    }
    
}

#Preview {
    ContentView()
}
