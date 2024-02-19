//

import SwiftUI

struct navigationlink: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { row in
                // NavigationLink will allow a list item to be shown with a > at the end
                // to indicate that it will take the user to a new screen.
                // This is the recommended way to do this from a UX perspective.

                NavigationLink("Row \(row)") {
                    Text("Detail \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    navigationlink()
}
