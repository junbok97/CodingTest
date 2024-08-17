// https://www.acmicpc.net/problem/1629

import Foundation


func solution() {
    
    let inputs = readLine()!
        .components(separatedBy: " ")
        .compactMap { Int64($0) }
    
    let a = inputs[0]
    let b = inputs[1]
    let c = inputs[2]
    
    print(mod(a,b,c))

}

func mod(_ a: Int64, _ b: Int64, _ c: Int64) -> Int64 {
    
    if b == 1 { return a % c }
    
    var result = mod(a, b/2, c)
    
    result = result * result % c
    if b % 2 == 0 { return result }
    return result * a % c

}


solution()
