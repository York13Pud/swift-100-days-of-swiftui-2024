//

import Foundation
import SwiftData

@Model
class Friend {
    var id: UUID
    var name: String
    var user: User?
    
    init(id: UUID, name: String, user: User? = nil) {
        self.id = id
        self.name = name
        self.user = user
    }
}
