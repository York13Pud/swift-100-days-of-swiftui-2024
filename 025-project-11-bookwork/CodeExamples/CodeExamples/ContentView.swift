//
import SwiftData
import SwiftUI

struct ContentView: View {
    // Create an array that contains all of the student names.
    // @Query is used to get the data from the student model:
    @Query var students: [Student]
    
    // Load the model context:
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                // Add a randomised student name to the modelContext:
                Button("Add") {
                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]

                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!

                    let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                    
                    // Add (insert) the student name to the model context and save it to the
                    // database:
                    modelContext.insert(student)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
