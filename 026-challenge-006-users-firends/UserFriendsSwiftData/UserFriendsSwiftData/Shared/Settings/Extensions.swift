//

import Foundation

// This allows for booleans to be comparable. See:
// https://www.hackingwithswift.com/forums/swiftui/how-can-i-sort-swiftdata-query-results-by-a-bool/24680

extension Bool: Comparable {
    public static func <(lhs: Self, rhs: Self) -> Bool {
        // the only true inequality is false < true
        !lhs && rhs
    }
}
