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
}
