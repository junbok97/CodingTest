import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var number = 0
    var result = ""
    var queue: [String] = []
    
    while queue.count < m * t {
        String(number, radix: n).forEach { queue.append(String($0)) }
        number += 1
    }
    
    for i in 0..<t {
        result += queue[i * m + p - 1]
    }
    
    return result.uppercased()
}
