//
//  3015 - 오아시스 재결합.swift
//  CodingTest
//
//  Created by 이준복 on 5/14/25.
//

import Foundation

func solution3015() {
    
    let N = Int(readLine()!)!
    
    var result = 0
    var stack: [(height: Int, count: Int)] = []
    
    for _ in 0..<N {
        
        let height = Int(readLine()!)!
        var count = 1
        
        while !stack.isEmpty, stack.last!.height <= height {
            result += stack.last!.count
            
            if stack.last!.height == height {
                count += stack.last!.count
            }
            stack.removeLast()
        }
        
        if !stack.isEmpty { result += 1 }

        stack.append((height, count))
    }
    
    print(result)
}

