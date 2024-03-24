//

import Foundation
import SwiftData

// Create a new class that will be used to build a student.
// It will use @Model to indicate that this is a model that will be used with SwiftData

@Model
class Student {
    var id: UUID
    var name: String

    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
