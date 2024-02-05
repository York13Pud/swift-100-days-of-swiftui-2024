//
//  ContentView.swift
//  code-examples
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
        
    var body: some View {
        // Example of a stepper:
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
        // .formatted() removes the extra numbers after the decimal.
        // in limits the range the stepper can go between.
        // step is the increment size
        
        // Examples of a date picker:
        DatePicker("Please enter a date", selection: $wakeUp)
            .labelsHidden() // Hides the text on the screen but is still there for screen readers.
        
        // Show only the time picker:
        DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
            .labelsHidden() // Hides the text on the screen but is still there for screen readers.
        
        // Allow only dates from today and after. Before dates show but are not selectable:
        DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
            .labelsHidden() // Hides the text on the screen but is still there for screen readers.
    }
}

#Preview {
    ContentView()
}
