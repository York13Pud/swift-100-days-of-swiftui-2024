//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let people = ["Bob", "Fred", "Jane", "Jo"]
        
        // A list is used to show a scrollable collection of items
        // You can use sections, along with dynamic and static content. For example:
        
        List {
            Section("Section A") {
                ForEach(0..<5) {
                    Text("Hello").tag($0)
                }
            }
            
            Section("Section B") {
                Text("I'm A")
                Text("Static Section")
            }
        }
        .listStyle(.grouped) // Applies a little bit of styling to the list.
    
        // An example that uses data from an array. Each list item is identified by
        // its ID (self):

        // List(people, id: \.self) {
        // Text("My name is \($0)")
        // }
        
        // The downside of the above is that you can't use a section or other possible
        // grouping methods. The work around is basically to use a foreach loop. For example:
        List {
            Section("People") {
                ForEach(people, id: \.self) {
                    Text("My name is \($0)")
                }
            }
        }
        .listStyle(.grouped)
        
        
        // If the list is just dynamic content, you can write it similar to this:
        // List(0..<2) {
        // Text("World").tag($0)
        // }
    }
    // An app is a bundle of files, including those in the asset catalogue. If you
    // want to load a file, such as a text file, you can use the Bundle.main.url method.
    //
    // For example, load a text file from the assets catalogue:
    func testBundles() {
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                // we loaded the file into a string!
                print(fileContents)
            }
        }
    }
    
    // Working with strings to put them into an array:
    func stringToArray() {
        let input = "a b c"
        let letters = input.components(separatedBy: " ")
        
        // Get a random item out of the array:
        let letter = letters.randomElement()
        
    }
    
    // Create a basic spell checker:
    func checkSpelling() {
        let word = "Swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        let allGood = misspelledRange.location == NSNotFound // Returns true (bad spelling) or false (correct spelling)
    }
    

}

#Preview {
    ContentView()
}
