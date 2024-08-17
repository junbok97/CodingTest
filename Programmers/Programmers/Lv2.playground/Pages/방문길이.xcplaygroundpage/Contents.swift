import Foundation

func solution(_ dirs:String) -> Int {
    var x = 0
    var y = 0
    var result: Set<String> = []
    
    for dir in dirs {
        switch dir {
        case "U":
            if 5 < y + 1 { continue }
            result.insert("\(x)\(y)UD")
            y += 1
        case "L":
            if x - 1 < -5 { continue }
            x -= 1
            result.insert("\(x)\(y)LR")
        case "R":
            if 5 < x + 1 { continue }
            result.insert("\(x)\(y)LR")
            x += 1
        default:
            if y - 1 < -5 { continue }
            y -= 1
            result.insert("\(x)\(y)UD")
        }
    }
    
    return result.count
}
