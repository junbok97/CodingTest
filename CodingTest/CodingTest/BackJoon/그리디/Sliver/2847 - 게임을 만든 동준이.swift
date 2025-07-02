//
//  2847 - 게임을 만든 동준이.swift
//  CodingTest
//
//  Created by 이준복 on 6/7/25.
//

import Foundation

func solution2847() {
    
    let N = Int(readLine()!)!
    var arr: [Int] = []
    
    for _ in 1...N {
        arr.append(Int(readLine()!)!)
    }
    
    
    var ans = 0
    var prev = arr.last!
    
    if arr.count == 1 {
        print(prev)
        return
    }
    
    for i in 0..<arr.count-1 {
        var num = arr[arr.count-2-i]
        if prev <= num {
            ans += num - prev + 1
            num = prev - 1
        }
        prev = num
    }
    
    print(ans)

}
