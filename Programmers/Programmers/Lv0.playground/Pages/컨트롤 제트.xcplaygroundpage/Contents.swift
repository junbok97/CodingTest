import Foundation

func solution(_ s:String) -> Int {
    
    var stack = [Int]()
    
    for str in s.components(separatedBy: " ") {
        if str == "Z" {
            stack.popLast()
        } else {
            stack.append(Int(str)!)
        }
    }
    
    return stack.reduce(0, +)
}

solution("1 2 Z 3")
