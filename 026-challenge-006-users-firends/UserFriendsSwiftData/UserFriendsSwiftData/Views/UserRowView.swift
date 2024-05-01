//

import Foundation
import SwiftUI

struct UserRowView: View {
    let userRow: User
    
    var body: some View {
        HStack {
            // Show a circle to depict if the user is active (green) or inactive (red):
            Circle()
                .fill(userRow.isActive ? .green : .red)
                .frame(width: 10)
            
            // Show the users name:
            Text(userRow.name)
        }
    }
}
