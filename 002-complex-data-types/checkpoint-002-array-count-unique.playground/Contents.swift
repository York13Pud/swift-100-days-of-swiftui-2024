import Cocoa

var soda: [String] = ["Coke", "Pepsi", "Irn-Bru", "Coke"]

print("The number of drinks in the soda array is \(soda.count)")

var sodaSet: Set<String> = Set(soda)

print("The number of unique drinks in the soda array is \(sodaSet.count)")
