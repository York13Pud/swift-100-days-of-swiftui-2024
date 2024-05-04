//
import StoreKit
import SwiftUI

struct LeaveReviewExample: View {
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        Button("Leave a review") {
            requestReview()
        }
    }
}

#Preview {
    LeaveReviewExample()
}
