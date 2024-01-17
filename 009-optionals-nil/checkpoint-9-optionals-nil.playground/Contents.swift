import Cocoa

func num(_ array:[Int]?) -> Int {return array?.randomElement() ?? Int.random(in: 1...100)}
print(num([100,200]))
