//

import SwiftUI

struct LoadImageURL: View {
    var body: some View {
        // The Image view will only work with images stored in the app bundle / assets.
        // To load a remote image from an URL, use the AsyncImage view instead.
        // Again, this uses async so it can run in the background to allow other tasks to run:
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
            
            // Check if the image is found. If So, load it with modifiers or show an error:
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image.")
            } else {
                ProgressView()
            }
        }
        // Limit the size of the image:
        .frame(width: 200, height: 200)
    }
}

#Preview {
    LoadImageURL()
}
