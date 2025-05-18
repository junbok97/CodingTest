import Foundation

func solution(_ n:Int) -> Int {
    
    var ternary = [Int]()
    var num = n
    
    while 3 <= num  {
        ternary.append(num % 3)
        num = num / 3
    }
    ternary.append(num)
    
    
    return ternary.reversed().enumerated().map {
        Int(pow(3.0, Double($0.offset))) * $0.element
    }.reduce(0, +)
    
}


func solution2(_ n:Int) -> Int {
    let flipToThree = String(n,radix: 3)
    let answer = Int(String(flipToThree.reversed()),radix:3)!
    return answer
}
