//
//  1541 - 잃어버린 괄호.swift
//  CodingTest
//
//  Created by 이준복 on 6/7/25.
//

import Foundation

func solution1542() {
    
    let input = readLine()!
    
    var tmp = 0
    var result = 0
    var sign = 1
    
    for char in input {
        if char == "+" || char == "-" {
            result += tmp * sign
            if char == "-" { sign = -1 }
            tmp = 0
        } else {
            tmp *= 10
            tmp += Int(String(char))!
        }
    }
    
    result += tmp * sign
    print(result)

}
