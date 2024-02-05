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
            .labelsHidden()
        
        // Allow only dates from today and after. Before dates show but are not selectable:
        DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
            .labelsHidden()
        
        // Show the day, month and year:
        Text(Date.now, format: .dateTime.day().month().year())
        
        // Show the day, month and year in long form with the time:
        Text(Date.now.formatted(date: .long, time: .shortened))
        
    }
    func exampleDates() {
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//     
//        let date = Calendar.current.date(from: components)
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: .now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
    }
}

#Preview {
    ContentView()
}
