//
//  1439 - 뒤집기.swift
//  CodingTest
//
//  Created by 이준복 on 6/7/25.
//

import Foundation

func solution1439() {
 
    let str = readLine()!
    
    var prev: Character = " "
    var ans = 0

    for char in str {
        if prev != char {
            ans += 1
        }
        prev = char
    }
    
    print(ans/2)
}
