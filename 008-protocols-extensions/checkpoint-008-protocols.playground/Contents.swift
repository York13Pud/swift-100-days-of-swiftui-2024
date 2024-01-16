import Cocoa

protocol Building {
    var rooms: Int { get set }
    var type: String { get set}
    var buildingCost: Int { get set }
    var estateAgent: String { get set }
    
    func Summary()
}

extension Building {
    func Summary() {
        print("\(estateAgent) has a \(rooms) room \(type) for sale, priced at £\(buildingCost.formatted())")
    }
}

struct House: Building {
    var rooms: Int
    var type = "house"
    var buildingCost: Int
    var estateAgent: String
}

struct Office: Building {
    var rooms: Int
    var type = "office"
    var buildingCost: Int
    var estateAgent: String
}


let home = House(rooms: 3, buildingCost: 100_000, estateAgent: "John")
home.Summary()

let office = Office(rooms: 50, buildingCost: 5_100_000, estateAgent: "Jane")
office.Summary()
