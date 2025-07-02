//
//  1931 - 회의실 배정.swift
//  CodingTest
//
//  Created by 이준복 on 6/7/25.
//

import Foundation

func solution1931() {
    
let N = Int(readLine()!)!

var times: [(start: Int, finish: Int)] = []

for _ in 1...N {
    let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
    times.append((inputs.first!, inputs.last!))
}

times = times.sorted {
    if $0.finish == $1.finish {
        return $0.start < $1.start
    }
    return $0.finish < $1.finish
}

var t = 0
var result = 0

for i in 0..<N {
    if times[i].start < t { continue }
    t = times[i].finish
    result += 1
}

print(result)

}
