//
//  12783-가장 긴 증가하는 부분 수열 3.swift
//  BAEKJOON
//
//  Created by 이준복 on 4/27/25.
//

import Foundation

//  12015-가장 긴 증가하는 부분 수열 2과 동일
func solution12783() {
    let N = Int(readLine()!)!

    let Numbers = readLine()!.split(separator: " ").map { Int($0)! }
    var results: [Int] = []

    for number in Numbers {
        guard let last = results.last else {
            results.append(number)
            continue
        }
        if last < number {
            results.append(number)
        } else {
            var start = 0
            var end = results.count - 1
            while start + 1 < end {
                let mid = (start + end) / 2

                if results[mid] < number {
                    start = mid
                } else {
                    end = mid
                }
            }

            if number <= results[start] {
                results[start] = number
            } else {
                results[end] = number
            }
        }
    }
    print(results.count)
}
