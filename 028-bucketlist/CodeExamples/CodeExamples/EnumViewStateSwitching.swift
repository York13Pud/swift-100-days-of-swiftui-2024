//

import SwiftUI

// Build three structs for three status':
struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}

struct EnumViewStateSwitching: View {
    // Define an enum with three state options:
    enum LoadingState {
        case loading, success, failed
    }
    
    // Use a variable to specify the state:
    @State private var loadingState = LoadingState.success

    var body: some View {
        // Use a switch / case to show the required struct:
        switch loadingState {
            case .loading:
                LoadingView()
            case .success:
                SuccessView()
            case .failed:
                FailedView()
        }
    }
}

#Preview {
    EnumViewStateSwitching()
}
