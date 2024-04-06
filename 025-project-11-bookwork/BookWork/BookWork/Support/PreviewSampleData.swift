//

import SwiftData
import SwiftUI

@MainActor
let previewContainer: ModelContainer = {
    
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Test Book", author: "Test Author", genre: "Fantasy", review: "This was a great book; I really enjoyed it.", rating: 4, date: Date.now)
        return container
    }
    catch {
            fatalError("Failed to create preview: \(error.localizedDescription)")
    }
}()
