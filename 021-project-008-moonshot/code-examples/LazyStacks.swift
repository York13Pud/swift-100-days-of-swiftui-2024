//

import SwiftUI

struct CustomText: View {
    let text: String

    var body: some View {
        Text(text)
    }

    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

struct LazyStacks: View {
    var body: some View {
        // An example of a vertical LazyVStack:
        ScrollView(.vertical) {
            // A LazyVStack works the same as a VStack when in a ScrollView but it will only
            // generate the scrollable content that is needed to fill the view.
            // When you scroll, the additional data views are generated and shown.
            LazyVStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
        
        // An example of a horizontal LazyVStack:
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
        }
    }
    
    
}

#Preview {
    LazyStacks()
}
