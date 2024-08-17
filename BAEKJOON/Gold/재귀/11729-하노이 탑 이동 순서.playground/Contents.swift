// https://www.acmicpc.net/problem/11729

import Foundation

func solution() {
    
    let n = Int(readLine()!)!
    
    print(pow(2, n) - 1)
    hanoi(n, 1, 2, 3)
}

func hanoi(_ n: Int, _ from: Int, _ tmp: Int, _ to: Int) {
    
    if n == 1 {
        print("\(from) \(to)")
        return
    }
    
    hanoi(n-1, from, to, tmp)
    print("\(from) \(to)")
    hanoi(n-1, tmp, from, to)
    
}

solution()
