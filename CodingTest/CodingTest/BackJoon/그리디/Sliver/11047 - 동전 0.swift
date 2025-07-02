//
//  11047 - 동전 0.swift
//  CodingTest
//
//  Created by 이준복 on 6/7/25.
//

import Foundation

func solution11047() {
    let inputs = readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }
    
    let N = inputs[0]
    var k = inputs[1]
    var result = 0
    
    var coins: [Int] = []
    
    for _ in 1...N {
        coins.append(Int(readLine()!)!)
    }
    
    
    for coin in coins.reversed() {
        result += k / coin
        k %= coin
    }
    
    print(result)
}
