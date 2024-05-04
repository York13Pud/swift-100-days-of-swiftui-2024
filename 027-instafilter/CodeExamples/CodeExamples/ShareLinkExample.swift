//

import SwiftUI

struct ShareLinkExample: View {
    var body: some View {
        // Share a link:
        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!)
        
        // Add a subject and body:
        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!, subject: Text("Learn Swift here"), message: Text("Check out the 100 Days of SwiftUI!"))
        
        // Create a customised button:
        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!) {
            Label("Spread the word about Swift", systemImage: "swift")
        }
        
        // Share an image:
        let example = Image(.example)

        ShareLink(item: example, preview: SharePreview("Singapore Airport", image: example)) {
            Label("Click to share", systemImage: "airplane")
        }
    }
}

#Preview {
    ShareLinkExample()
}
