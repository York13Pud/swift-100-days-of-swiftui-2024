import Cocoa

enum SquareRootError: Error {
  // Proper capitalization in outOfBounds
  case outOfBounds, noSquareRoot
}

// Added return type of Int to return the square root
func getSquareRoot(Of number: Int) throws -> Int {
  // guard instead of if for early returns
  guard number >= 1 && number <= 10_000 else {
    throw SquareRootError.outOfBounds
  }
  
  // Cleaner way of getting the first number that matches
  let result = (1...100)
    .first { $0 * $0 == number }
  
  // guard again
  guard let result = result else {
    throw SquareRootError.noSquareRoot
  }
  
  // Return the result
  return result
}

do {
  let squareRoot = try getSquareRoot(Of: 9)
  print(squareRoot)
} catch SquareRootError.outOfBounds {
  print("Please use a number between 1 and 10,000")
} catch SquareRootError.noSquareRoot {
  print("There is no even square root to this problem")
}
