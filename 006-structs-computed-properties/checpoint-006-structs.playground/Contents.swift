import Cocoa

struct Car {
    public let model: String
    public let seats: Int
    public let maxGears: Int
    private(set) var currentGear: Int = 0
    
    mutating func gearUp(gear: Int) -> Int {
        if currentGear + gear > maxGears {
            print("Cannot change gear to be above \(maxGears).")
            return currentGear
        } else {
            currentGear += gear
            print("Gear changed. Currently set to \(currentGear).")
            return currentGear
        }
    }
    
    mutating func gearDown(gear: Int) -> Int {
        if currentGear - gear < 0 {
            print("Cannot change gear to below 0.")
            return currentGear
        } else {
            currentGear -= gear
            print("Gear changed. Currently set to \(currentGear).")
            return currentGear
        }
    }
}

var focus = Car(model: "Ford Focus", seats: 5, maxGears: 5)
print("Current Gear (start point): \(focus.currentGear)")

// Fails:
focus.gearUp(gear: 6)

// Success:
focus.gearUp(gear: 5)

// Fails:
focus.gearDown(gear: 6)

// Success:
focus.gearDown(gear: 5)

// Success:
focus.gearUp(gear: 3)

// View individual properties:
print("Model: \(focus.model)") // Cannot change model as it's a constant
print("Seats: \(focus.seats)") // Cannot change seats as it's a constant
print("Max Gears: \(focus.maxGears)") // Cannot change maxGears as it's a constant
print("Current Gear: \(focus.currentGear)") // Cannot change currentGear as it's a private property
