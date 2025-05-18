import Foundation

func solution(_ s:String) -> Int {
    
    var stack = [Character]()
    var count = 0
    
    for c in s {
        if stack.isEmpty {
            count += 1
            stack.append(c)
        } else {
            if stack.last! == c {
                stack.append(c)
            } else {
                stack.popLast()
            }
        }
    }
    
    return count
}

solution("aaabbaccccabba")



