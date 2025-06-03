//
//  1788 - 피보나치 수의 확장.swift
//  CodingTest
//
//  Created by 이준복 on 6/1/25.
//

import Foundation

func solution1788() {
    
    var N = Int(readLine()!)!
    let mod = 1_000_000_000
    
    var fibo = Array(repeating: 0, count: abs(N)+3)
    fibo[1] = 1
    
    if 0 < N {
        for i in 2...N+2 {
            fibo[i] = (fibo[i-1] + fibo[i-2]) % mod
        }
    } else {
        N = abs(N)
        for i in 2...N+2 {
            fibo[i] = (fibo[i-2] - fibo[i-1]) % mod
        }
    }
    
    let result = fibo[N]
    if 0 < result {
        print("1")
    } else if result < 0 {
        print("-1")
    } else {
        print("0")
    }
    
    print(abs(result))
}
