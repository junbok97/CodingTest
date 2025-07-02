//
//  11399 - ATM.swift
//  CodingTest
//
//  Created by 이준복 on 6/7/25.
//

import Foundation

func solution11399() {
    
    var result = 0
    
    let _ = Int(readLine()!)!
    let _ = readLine()!
        .split(separator: " ")
        .map { Int($0)! }
        .sorted()
        .reduce(0) {
            let t = $0 + $1
            result += t
            return t
        }
    
    print(result)

}
