//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    // Sort by title and then by author:
    @Query(sort: [
        SortDescriptor(\Book.rating, order: .reverse),
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author)
    ]) var books: [Book]

    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                    .foregroundStyle(book.rating == 1 ? .red : .primary)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                                RatingView(rating: .constant(book.rating))
                                    .font(.footnote)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationDestination(for: Book.self) { book in
                DetailView(book: book)
            }
           .navigationTitle("Bookworm")
           .toolbar {
               ToolbarItem(placement: .topBarLeading) {
                   EditButton()
               }
               
               ToolbarItem(placement: .topBarTrailing) {
                   Button("Add Book", systemImage: "plus") {
                       showingAddScreen.toggle()
                   }
               }
           }
           
           .sheet(isPresented: $showingAddScreen) {
               AddBookView()
           }
       }
       
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our query
            let book = books[offset]

            // delete it from the context
            modelContext.delete(book)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(previewContainer)
}
