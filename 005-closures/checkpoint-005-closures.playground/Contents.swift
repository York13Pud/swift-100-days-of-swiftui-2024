import Cocoa

// Define the array of numbers:
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

// Use a closure to perform:
let processLuckyNumbers = { (source: [Int]) in
    // Filter out the even numbers:
    source.filter { !$0.isMultiple(of: 2) }
          .sorted() // Sort the remaining odd numbers assentingly
          .map() // Map the numbers to a new array
    { print ("\($0) is a lucky number")} // Print out each row
}

// Process the array of numbers:
processLuckyNumbers(luckyNumbers)
