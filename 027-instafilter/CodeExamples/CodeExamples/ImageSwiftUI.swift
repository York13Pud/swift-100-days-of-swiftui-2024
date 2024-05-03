//

import SwiftUI

struct ImageSwiftUI: View {
    @State private var image: Image?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
        image = Image(.example)
    }
}

#Preview {
    ImageSwiftUI()
}
