// https://www.acmicpc.net/problem/1759

import Foundation


func isVowel (_ str: String) -> Bool {
    str.contains("a") || str.contains("e") || str.contains("i") || str.contains("o") || str.contains("u")
}

func solution() {
    
    let inputs = readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }
    
    let L = inputs[0]
    let C = inputs[1]
    
    let alphabet = readLine()!
        .split(separator: " ")
        .map { String($0) }
        .sorted()
    
    var result = ""
    var arr = Array(repeating: "", count: L)
    
    backTracking()
    
    print(result)
    
    
    func backTracking(_ k: Int = 0, _ st: Int = 0) {
        
        if k == L {
            var vowelCount = 0
            var consonant = 0
            
            for i in 0..<L {
                if isVowel(arr[i]) {
                    vowelCount += 1
                } else { consonant += 1}
            }
            
            if 1 <= vowelCount, 2 <= consonant {
                result += "\(arr.joined())\n"
            }
            
            return
        }
        
        for i in st..<C {
            arr[k] = alphabet[i]
            backTracking(k+1, i+1)
        }
    }
    
}


solution()

