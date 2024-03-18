//

import SwiftUI

struct ValidateDisableForm: View {
    @State private var username = ""
    @State private var email = ""

    var body: some View {
        // Build a simple form:
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }

            Section {
                Button("Create account") {
                    print("Creating account…")
                }
            }
            // Check if the username and email fields are match the required criteria.
            // If under, disable the button, else enable it:
            .disabled(disableForm)
        }
        
        
    }
    // Define a variable that checks for the conditions to enable or disable the Create Account button:
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
}


#Preview {
    ValidateDisableForm()
}
