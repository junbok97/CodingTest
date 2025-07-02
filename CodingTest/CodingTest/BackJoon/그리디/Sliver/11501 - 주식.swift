//
//  11501 - 주식.swift
//  CodingTest
//
//  Created by 이준복 on 6/7/25.
//

import Foundation

func solution11501() {
    let T = Int(readLine()!)!
    
    for _ in 1...T {
        
        var result = 0
        
        let N = Int(readLine()!)!
        let a = readLine()!
            .split(separator: " ")
            .map{ Int($0)! }
        
        var temp = a.last!
        
        for i in (0..<N-1).reversed() {
            if temp < a[i] { temp = a[i] }
            result += temp - a[i]
        }
        
        print(result)
    }
}
