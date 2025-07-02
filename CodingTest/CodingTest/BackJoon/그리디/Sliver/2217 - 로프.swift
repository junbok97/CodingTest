//
//  2217 - 로프.swift
//  CodingTest
//
//  Created by 이준복 on 6/7/25.
//

import Foundation

func solution2217() {
    let N = Int(readLine()!)!
    
    let ropes = (1...N).map { _ in
        Int(readLine()!)!
    }.sorted()
    
    var result = 0
    
    for i in 0..<N {
        result = max(result, ropes[i] * (N-i))
    }
    
    print(result)

}
