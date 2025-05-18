//
//  14003-가장 긴 증가하는 부분 수열 5.swift
//  BAEKJOON
//
//  Created by 이준복 on 4/27/25.
//

import Foundation


func solution14003() {
    let N = Int(readLine()!)!
    let numbers = readLine()!
        .split(separator: " ")
        .map { Int($0)! }
    
    
    
    var lis: [Int] = []
    var lisIndeies = Array(repeating: -1, count: N)
    
    
    for i in 0..<N {
        let number = numbers[i]
        
        guard let last = lis.last else {
            lis.append(number)
            lisIndeies[i] = lis.count-1
            continue
        }
        
        if last < number {
            lis.append(number)
            lisIndeies[i] = lis.count-1
        } else {
            var start = 0
            var end = lis.count
            
            while start + 1 < end {
                let mid = (start + end) / 2
                
                if lis[mid] < number {
                    start = mid
                } else {
                    end = mid
                }
            }
            
            if number <= lis[start] {
                lis[start] = number
                lisIndeies[i] = start

            } else {
                lis[end] = number
                lisIndeies[i] = end
            }
        }
    }
    
    
    
    
    var target = lis.count - 1
    var results: [Int] = []
    for i in (0..<N).reversed() {
        if target < 0 { break }
        if lisIndeies[i] == target {
            target -= 1
            results.append(numbers[i])
        }
    }
    
    print(lis.count)
    print(results
        .reversed()
        .map { String($0) }
        .joined(separator: " "))
}


//100
//60 44 28 62 223 99 187 44 29 28 147 169 35 80 147 175 201 3 174 175 78 38 87 204 157 199 1 50 199 124 196 147 233 231 2 113 186 230 176 255 245 156 12 230 82 241 225 197 35 165 221 198 196 23 224 24 42 56 235 199 65 80 196 231 160 225 194 154 13 36 145 7 197 249 106 47 5 238 80 7 9 126 34 157 104 253 161 139 71 249 240 3 234 217 108 80 224 99 154 69
// 1 2 12 23 24 42 56 65 80 106 126 157 161 217 224

