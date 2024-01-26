import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            Color.orange
            
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
                    .background(.red)
                    .foregroundColor(.white)
                    
                    HStack(spacing: 30) {
                        Text("4")
                        Text("5")
                        Text("6")
                    }
                    .frame(minWidth: 150, maxWidth: .infinity, maxHeight: 30)
                    .background(.blue)
                    .foregroundColor(.white)
                    
                    HStack(spacing: 30) {
                        Text("7")
                        Text("8")
                        Text("9")
                    }
                    .frame(minWidth: 150, maxWidth: .infinity, maxHeight: 30)
                    .background(.green)
                    .foregroundColor(.white)
                }
                .padding()
            }
        }
        .ignoresSafeArea() // Allows the background colour to go the full height of the                        screen
    }
}

#Preview {
    ContentView()
}
