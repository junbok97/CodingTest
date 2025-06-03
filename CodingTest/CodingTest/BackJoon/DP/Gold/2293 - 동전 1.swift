//
//  2293 - 동전 1.swift
//  CodingTest
//
//  Created by 이준복 on 5/18/25.
//
// 문제 링크 : https://www.acmicpc.net/problem/2293
// 알고리즘 복잡도 :


import Foundation


func solution2293() {
 
    let inputs = readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }
    
    let (N, K) = (inputs[0], inputs[1])
    
    var a: [Int] = []
    var d = Array(repeating: 0.0, count: K+1)
    d[0] = 1
    
    for _ in 1...N {
        let coin = Int(readLine()!)!
        if K < coin { continue }
        a.append(coin)
    }
    
    a = a.sorted()
    for i in 0..<a.count {
        for j in a[i]...K {
            d[j] += d[j - a[i]]
        }
    }
    
    print(Int(d[K]))
}
