import Foundation

func solution(_ polynomial:String) -> String {
    let arr = polynomial.components(separatedBy: " + ")
    
    let x = arr.filter { $0.last == "x" }.map {
        var str = $0
        str.removeLast()
        return str.isEmpty ? 1 : Int(str)!
    }.reduce(0, +)

    let y = arr.compactMap { Int($0) }.reduce(0, +)
    
    if x == 1 {
        if y == 0 {
            return "x"
        } else {
            return "x + \(y)"
        }
    } else if x == 0 {
        return "\(y)"
    } else if y == 0 {
        return "\(x)x"
    }
    
    return "\(x)x + \(y)"
}
