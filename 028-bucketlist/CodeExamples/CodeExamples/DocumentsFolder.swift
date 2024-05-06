//

import SwiftUI

struct DocumentsFolder: View {
    var body: some View {
        // Note: The file written in this view is not saved to the users folder (Files app).
        // It is saved to the apps sandbox folder.
        
        Button("Read and Write") {
            // Pass the data to be written to the Data struct. It acts as a byte converter.
            // This of it as being similar to the binary function in python:
            let data = Data("Test Message".utf8)
            
            // Specify the file name and that it should be written and read from the apps documents folder:
            let url = URL.documentsDirectory.appending(path: "message.txt")
            
            // Attempt to write the file and then read it backL
            do {
                // atomic = write file in one lump. It uses a temp file to save the contents to and then
                // renames it when finished. It helps to stop another process from using an incomplete file.
                //
                // completeFileProtection = Encrypts the file so that only the app can read it. iOS handles
                // the encryption:
                try data.write(to: url, options: [.atomic, .completeFileProtection])

                // Read the file back and print out the contents:
                let input = try String(contentsOf: url)
                print(input)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    DocumentsFolder()
}
