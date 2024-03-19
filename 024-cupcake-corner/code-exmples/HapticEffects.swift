//

import SwiftUI

struct HapticEffects: View {
    @State private var counter = 0

    var body: some View {
        Button("Tap Count: \(counter)") {
            counter += 1
        }
        // Use haptic feedback to run when the button is tapped and increase
        // based on the counter:
        .sensoryFeedback(.increase, trigger: counter)

        // Other examples of using the haptic feedback engine:
        // .sensoryFeedback(.impact(flexibility: .soft, intensity: 0.5), trigger: counter)
        // .sensoryFeedback(.impact(weight: .heavy, intensity: 1), trigger: counter)
    }
}

#Preview {
    HapticEffects()
}
