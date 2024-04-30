//

import SwiftData
import SwiftUI

@main
struct UserFriendsSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
