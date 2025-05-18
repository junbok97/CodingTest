// https://www.acmicpc.net/problem/1182

import Foundation

func solution() {
    
    let inputs = readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }
    
    let sequence = readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }
    
    let N = inputs[0]
    let K = inputs[1]
    
    var count = 0
    
    func backTraking(_ sum: Int, _ index: Int) {
        
        if index == N {
            if sum == K { count += 1 }
            return
        }
        
        backTraking(sum, index+1)
        backTraking(sum+sequence[index], index+1)
    }
    
    backTraking(0, 0)
    
    // 공집합일 때 체크
    if K == 0 { count -= 1 }
    
    print(count)
    
}


solution()
