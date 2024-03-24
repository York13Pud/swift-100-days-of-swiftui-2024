//

import SwiftData
import SwiftUI

@main
struct CodeExamplesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // Initialise the model so that it can be used throughout the app:
        .modelContainer(for: Student.self)
    }
}
