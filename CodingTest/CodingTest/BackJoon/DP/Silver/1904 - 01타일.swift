//
//  1904 - 01타일.swift
//  CodingTest
//
//  Created by 이준복 on 6/1/25.
//

import Foundation


func solution1904() {
    
    let N = Int(readLine()!)!
    if N <= 2 {
        print(N)
        return
    }
    
    var f2 = 0
    var f1 = 1
    var f = 0
    
    for _ in 1...N {
        f = (f2 + f1) % 15746
        f2 = f1
        f1 = f
    }
    
    print(f)
}
