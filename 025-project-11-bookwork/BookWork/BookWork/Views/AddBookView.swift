//
import SwiftData
import SwiftUI

struct AddBookView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    @State private var showingAddScreen = false
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)

                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }

                Section {
                    Button("Save") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating, date: Date.now)
                        modelContext.insert(newBook)
                        
                        dismiss()
                    }
                }
                .disabled(diableSaveButton)
            }
            .navigationTitle("Add Book")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
            }
        }
    }
    
    var diableSaveButton: Bool {
        title.count < 5 ||
        author.count < 5 ||
        rating < 1 ||
        genre.count < 1 ||
        review.count < 5
    }
}

#Preview {
    AddBookView()
}
