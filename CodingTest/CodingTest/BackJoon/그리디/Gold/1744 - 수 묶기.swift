//
//  1744 - 수 묶기.swift
//  CodingTest
//
//  Created by 이준복 on 6/7/25.
//

import Foundation

func solution1744() {
    
    let N = Int(readLine()!)!
    
    var ans = 0
    var zero = 0
    var one = 0
    var negative: [Int] = []
    var positve: [Int] = []
    
    for _ in 1...N {
        let num = Int(readLine()!)!
        
        if num < 0 {
            negative.append(num)
        } else if num == 0 {
            zero += 1
        } else if num == 1 {
            one += 1
        } else {
            positve.append(num)
        }
    }
    
    negative.sort()
    positve.sort(by: >)
    
    for i in 0..<negative.count/2 {
        ans += negative[2*i] * negative[2*i+1]
    }
    
    if negative.count % 2 != 0 {
        if 0 == zero {
            ans += negative.last!
        }
    }
    
    for i in 0..<positve.count/2 {
        ans += positve[2*i] * positve[2*i+1]
    }
    
    if positve.count % 2 != 0 {
        ans += positve.last!
    }
    
    ans += one

    print(ans)

}
