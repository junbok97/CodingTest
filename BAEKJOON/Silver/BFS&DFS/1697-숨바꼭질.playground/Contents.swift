// https://www.acmicpc.net/problem/1697

import Foundation

var demessions = readLine()!
    .split(separator: " ")
    .compactMap { Int($0) }

let NotVisited = -1
let start = demessions.first!
let end = demessions.last!


var array = Array(repeating: NotVisited, count: 100001)
var queue: [Int] = [start]

array[start] = 0


while array[end] == NotVisited {
    let current = queue.removeFirst()
    
    for next in [current+1, current-1, current*2] {
        if !(0...100000 ~= next) { continue }
        if array[next] != NotVisited { continue }
        queue.append(next)
        array[next] = array[current] + 1
    }
}

print(array[end])
