//
//  4833 - 삼각 그래프.swift
//  CodingTest
//
//  Created by 이준복 on 6/1/25.
//

import Foundation

func solution4833() {
    
    var count = 0
    
    while true {
        let N = Int(readLine()!)!
        if N == 0 { break }
        count += 1
        
        var d = Array(repeating: Array(repeating: 0, count: 3), count: N)
        var a: [[Int]] = []
        
        for _ in 1...N {
            let inputs = readLine()!
                .split(separator: " ")
                .compactMap { Int($0) }
            a.append(inputs)
        }
    
        d[0][0] = Int.max
        d[0][1] = a[0][1]
        d[0][2] = a[0][1] + a[0][2]

        for i in 1..<N {
            d[i][0] = a[i][0] + min(d[i-1][0], d[i-1][1])
            d[i][1] = a[i][1] + min(d[i-1][0], d[i-1][1], d[i-1][2], d[i][0])
            d[i][2] = a[i][2] + min(d[i-1][1], d[i-1][2], d[i][1])
        }
    
        print("\(count). \(d[N-1][1])")
    }
    
}
