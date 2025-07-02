//
//  2457 - 공주님의 정원.swift
//  CodingTest
//
//  Created by 이준복 on 6/7/25.
//

import Foundation


func solution2456() {
    
    struct Flower: Hashable {
        let start: Int
        let end: Int
    }
    
    let N = Int(readLine()!)!
    var flowers: Set<Flower> = []
    
    for _ in 1...N {
        let inputs = readLine()!
            .split(separator: " ")
            .map { Int($0)! }

        flowers.insert(
            .init(
                start: inputs[0] * 100 + inputs[1],
                end: inputs[2] * 100 + inputs[3]
            )
        )
    }
    
    var t = 301
    var result = 0
    
    while t < 1201 {
        var temp = t
        
        for flower in flowers {
            if flower.start <= t && temp < flower.end {
                temp = flower.end
            }
        }
        
        if temp == t {
            print(0)
            return
        }
        
        result += 1
        t = temp
    }
    
    print(result)

}



