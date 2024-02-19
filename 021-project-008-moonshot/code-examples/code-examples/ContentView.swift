//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // By default, all images are sized to their full size.
        VStack {
            Image("example") // Or you can use Image(.example)
                .resizable() // Sizes the image to fit inside the frame.
                .scaledToFit() // The image is scaled to fit but there could be space left.
            // .scaledToFill() // This will scale the image to fit an aspect ratio. It will go outside the frame if needed.
                .frame(width: 80, height: 100)
            // .clipped() // Shows only the part of the image within the frame if resizable is not used.
            
            Image(.example)
                .resizable()
                .scaledToFit()
                .containerRelativeFrame(.horizontal) { size, axis in
                    size * 0.8 // Make the image fill 80% of the screen horizontally.
                } // Creates a container frame that is relative to the screen size.
        }
    }
}

#Preview {
    ContentView()
}
