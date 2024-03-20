//

import SwiftUI

@Observable
class User: Codable {
    // Use an enum case to rewrite the _name in the output to name:
    enum CodingKeys: String, CodingKey {
            case _name = "name"
    }
    
    var name = "Taylor"
}

struct CodableObservable: View {
    var body: some View {
            Button("Encode Taylor", action: encodeTaylor)
        }
        
    // Encode the User class to JSON:
    func encodeTaylor() {
        let data = try! JSONEncoder().encode(User())
        
        // Show the values in the JSON data in a JSON format:
        let str = String(decoding: data, as: UTF8.self)
        print(str)
    }
}

#Preview {
    CodableObservable()
}
