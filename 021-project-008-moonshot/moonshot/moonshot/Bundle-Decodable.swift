//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T { // T is a generic in this case so the input data dan be anything.
        // Attempts to locate the file containing the data:
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        // Attempts to load the file containing the data:
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        // Instantiate an instance of the JSON decoder:
        let decoder = JSONDecoder()
        
        // Format the date:
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        // Lastly, process the JSON data into a dictionary:
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}
