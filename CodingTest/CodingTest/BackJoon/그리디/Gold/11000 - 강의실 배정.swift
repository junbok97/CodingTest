//
//  11000 - 강의실 배정.swift
//  CodingTest
//
//  Created by 이준복 on 6/7/25.
//

import Foundation

func solution11000() {
    
    let N = Int(readLine()!)!
    
    var arr: [(Int, Bool)] = []
    var ans = 0
    var current = 0
    
    for _ in 1...N {
        let inputs = readLine()!.split(separator: " ").map { Int($0)! }
        arr.append((inputs.first!, true))
        arr.append((inputs.last!, false))
    }
    
    arr.sort {
        if $0.0 != $1.0 {
            return $0.0 < $1.0
        }
        return !$0.1
    }
    
    for element in arr {
        if element.1 {
            current += 1
            ans = max(ans, current)
        } else {
            current -= 1
        }
    }
    
    print(ans)

}
