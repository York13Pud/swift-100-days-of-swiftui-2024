//

import SwiftUI

struct ContentView: View {
    @State private var blurAmount = 0.0 {
        didSet {
            print("New value is \(blurAmount)")
        }
    }
    
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.clear

    var body: some View {
        VStack {
            Text("Hello, World!")
                .blur(radius: blurAmount)

            Slider(value: $blurAmount, in: 0...20)
                // Without onChange, if you just printed out the value, it would not show as the slider
                // doesn't update the binding value externally. It does internally but it can't be shown.
                // You can also print the old value as well as the new value as follows:
                .onChange(of: blurAmount) { oldValue, newValue in
                    print("Old value: \(oldValue). New value: \(newValue)")
                }
            
            Button("Change Frame Background") {
                showingConfirmation = true
            }
            .frame(width: 300, height: 300)
            .background(backgroundColor)
            // This modifier will show a slide up menu from the bottom of the screen with some
            // options to change the background colour of the button:
            .confirmationDialog("Change background", isPresented: $showingConfirmation) {
                Button("Red") { backgroundColor = .red }
                Button("Blue") { backgroundColor = .blue }
                Button("Green") { backgroundColor = .green }
                Button("Default") { backgroundColor = .clear }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Select a new color")
            }
        }
    }
}

#Preview {
    ContentView()
}
