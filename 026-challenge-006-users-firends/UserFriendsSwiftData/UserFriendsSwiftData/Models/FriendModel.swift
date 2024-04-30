//
//
//import Foundation
//import SwiftData
//
//@Model
//class Friend {
//    var id: UUID
//    var name: String
//    
//    init(id: UUID, name: String) {
//        self.id = id
//        self.name = name
//    }
//    
//    // This is referenced from the User model to connect the two models via a many to many relationship.
//    // A table with the same name (userFriends) will be created and contain the ID of the User and the ID of the Friend:
//    var usersFreiends: [User]?
//}

import Foundation
import SwiftData

@Model
class Friend: Codable {
    enum CodingKeys: CodingKey {
        case id, name
    }

    let id: UUID
    var name: String

    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
    }
}
