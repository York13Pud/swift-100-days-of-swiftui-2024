//

import Foundation
import SwiftData

@Model
class Friend {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
    
    // This is referenced from the User model to connect the two models via a many to many relationship.
    // A table with the same name (userFriends) will be created and contain the ID of the User and the ID of the Friend:
    var usersFreiends: [User]?
}
