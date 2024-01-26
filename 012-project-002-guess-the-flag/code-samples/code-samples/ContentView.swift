import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20){
            Text("This is a")
            Text("VStack")
        }
        .padding()

        VStack {
            
            HStack {
                Text("This is a")
                Text("HStack inside a VStack")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
