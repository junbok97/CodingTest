// https://www.acmicpc.net/problem/15666

import Foundation


func solution() {
    
    let inputs = readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }
    
    let N = inputs[0]
    let M = inputs[1]
    
    let numbers = readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }
        .sorted()
    
    
    var result = ""
    var arr = Array(repeating: 0, count: M)
    
    
    func backTracking(_ k: Int = 0, _ st: Int = 0) {
        
        if k == M {
            result += "\(arr.map { "\($0)" }.joined(separator: " "))\n"
            return
        }
        
        var tmp = -1
        
        for i in st..<N {
            if numbers[i] != tmp { // k번째 자리에 오지 않았던 숫자라면
                arr[k] = numbers[i]
                tmp = arr[k]
                backTracking(k+1, i)
            }
        }
    }
    
    
    backTracking()
    print(result)
    
}


solution()
