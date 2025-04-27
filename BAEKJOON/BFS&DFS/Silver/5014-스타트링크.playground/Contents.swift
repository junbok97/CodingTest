// https://www.acmicpc.net/problem/5014

import Foundation


func solution() {
    
    let inputs = readLine()!
        .components(separatedBy: " ")
        .compactMap { Int($0) }
        
    
    let F = inputs[0] // 건물의 높이
    let S = inputs[1] // 강호의 현재 위치
    let G = inputs[2] // 스타트링크가 있는 위치
    let U = inputs[3] // 엘레베이터가 올라가는 높이
    let D = inputs[4] // 엘레베이터가 내려가는 높이
    
    
    var building = Array(repeating: -1, count: F + 1)
    var queue: [Int] = []
    var index = 0

    building[S] = 0
    queue.append(S)
    
    while index < queue.count {
        
        let floor = queue[index]
        index += 1
        
        if floor == G {
            print(building[floor])
            return
        }
        
        let up = floor + U
        let down = floor - D
        
        
        if up <= F && building[up] < 0 {
            building[up] = building[floor] + 1
            queue.append(up)
        }
        
        if 1 <= down && building[down] < 0 {
            building[down] = building[floor] + 1
            queue.append(down)
        }
        
    }
    
    print("use the stairs")
}


solution()
