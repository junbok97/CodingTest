// https://www.acmicpc.net/problem/6603

import Foundation


func solution() {
    
    let lottoLimit = 6
    
    var arr =  Array(repeating: 0, count: lottoLimit)
    
    while true {
        
        let inputs = readLine()!
            .split(separator: " ")
            .compactMap { Int($0) }
        
        let N = inputs[0]
        
        if N == 0 { break }
        
        let num = Array(inputs[1...N])
        
        var result = ""
        
        backTracking()
        
        print(result)
        
        
        func backTracking(_ k: Int = 0, _ st: Int = 0) {
            
            if k == lottoLimit {
                result += "\(arr.map { "\($0)" }.joined(separator: " "))\n"
                return
            }
            
            for i in st..<N {
                arr[k] = num[i]
                backTracking(k+1, i+1)
            }
        }
    }
    
    
}


solution()
