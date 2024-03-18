//

import SwiftUI

// Create a struct for storing and individual songs information:
struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

// Create a struct to store all of the songs into an array:
struct Response: Codable {
    var results: [Result]
}

struct CodableData: View {
    @State private var results = [Result]()

    var body: some View {
        // Display a list of all the results:
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
                }
            }
        // Execute the loadData function and load the data into the
        // view when it is returned. Other operations can continue as
        // this will be run in the background (async await):
        .task {
                await loadData()
            }
    }
    
    func loadData() async {
        // Collect the required data from the itunes API:
        guard let url = URL(string: "https://itunes.apple.com/search?term=bon+jovi&entity=song") else {
                // If the URL is invalid, print an error and return nothing:
                print("Invalid URL")
                return
            }
        
        // Process the JSON returned from the URL:
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Decode the data and add each entry to the the Response struct:
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        
        // Print an error in the console if it cannot process the data:
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    CodableData()
}
