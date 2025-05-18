// https://www.acmicpc.net/problem/9663

import Foundation

func solution() {
    
    let N = Int(readLine()!)!
    
    
    var isUsed1 = Array(repeating: false, count: N)
    var isUsed2 = Array(repeating: false, count: 2*N - 1)
    var isUsed3 = Array(repeating: false, count: 2*N - 1)
    
    
    var result = 0
    
    func backTracking(_ row: Int) {
        
        if row == N {
            result += 1
            return
        }
        
        
        for col in 0..<N {
            
            if isUsed1[col] || isUsed2[row+col] || isUsed3[row-col+N-1] { continue }
            
            isUsed1[col] = true
            isUsed2[row+col] = true
            isUsed3[row-col+N-1] = true
            
            backTracking(row + 1)
            
            isUsed1[col] = false
            isUsed2[row+col] = false
            isUsed3[row-col+N-1] = false
        }
    }
    
    backTracking(0)
    print(result)
    
}



solution()
