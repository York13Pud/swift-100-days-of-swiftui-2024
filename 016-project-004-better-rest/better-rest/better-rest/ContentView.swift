//

import CoreML
import SwiftUI

struct ContentView: View {
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
//    @State private var alertTitle = ""
//    @State private var alertMessage = ""
//    @State private var alertVisible = false
    
    @State private var bedTime: Date = defaultWakeTime
    
    var body: some View {
        NavigationStack {
            Form {
                Section("When do you want to wake up?") {
                    
                    DatePicker("Please select a time".capitalized, selection: $wakeUp, displayedComponents: .hourAndMinute)
                            .onChange(of: wakeUp, initial: true) {
                                oldValue, newValue in calculateBedtime()
                            }
                }
                
                Section("Desired amount of sleep") {
                    
                    Stepper("\(sleepAmount.formatted()) hours".capitalized, 
                            value: $sleepAmount,
                            in: 4...12,
                            step: 0.25)
                                .onChange(of: sleepAmount, initial: true) {
                                    oldValue, newValue in calculateBedtime()
                                }
                }
                
                Section("Daily coffee intake") {
                    
                    Stepper("^[\(coffeeAmount) Cup](inflect: true)", value: $coffeeAmount, in: 1...20) // "^[\(coffeeAmount) Cup](inflect: true)" pluralises Cup when needed.
                            .onChange(of: coffeeAmount, initial: true) {
                            oldValue, newValue in calculateBedtime()
                        }
                }
                
                Section("Your ideal bedtime is") {
                    Text("\(bedTime.formatted(date: .omitted, time: .shortened))")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                        .font(.title2)
                        .foregroundStyle(.red)
                }
            }
            .navigationTitle("BetterRest")
        }
    }
    
    func calculateBedtime() {
        do {
            // Create an instance of the ML model to make it usable:
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            // Predict the amount of sleep needed
            let prediction = try model.prediction(wake: Int64(hour + minute), estimatedSleep: sleepAmount, coffee: Int64(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
                       
            bedTime = sleepTime
        }
        
        catch {
//            alertTitle = "Error"
//            alertMessage = "Sorry. There was an error calculating your bedtime."
        }
        //alertVisible = true
        
    }
    
}

#Preview {
    ContentView()
}
