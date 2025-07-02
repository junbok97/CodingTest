//
//  1026 - 보물.swift
//  CodingTest
//
//  Created by 이준복 on 6/7/25.
//

import Foundation

func solution1026() {
    let _ = Int(readLine()!)!
    
    let A = readLine()!
        .split(separator: " ")
        .map { Int($0)! }
        .sorted()
    
    let B = readLine()!
        .split(separator: " ")
        .map { Int($0)! }
        .sorted(by: >)
    
    let result = zip(A, B)
        .map { $0 * $1 }
        .reduce(0, +)
    
    print(result)
}
