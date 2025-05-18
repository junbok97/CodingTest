import Foundation

struct Stack<T> {
    private var stack: [T] = []
    
    public var count: Int {
        return stack.count
    }
    
    public var isEmpty: Bool {
        return stack.isEmpty
    }
    
    public mutating func push(_ element: T) {
        stack.append(element)
    }
    
    public mutating func pop() -> T? {
        return isEmpty ? nil : stack.popLast()
    }
}


func solution(_ s:String) -> Int{
    
    var answer = Stack<Character>()
    
    for s in Array(s) {
        if !answer.isEmpty {
            let ch = answer.pop()!
            if ch == s {
                continue
            }
            answer.push(ch)
        }
        answer.push(s)
    }
    return answer.isEmpty ? 1 : 0
}

func solution2(_ s:String) -> Int{
    
    var answer = [Character]()
    let str = Array(s)

    for s in str {
        if !answer.isEmpty {
            let c = answer.popLast()!
            if s == c {
                continue
            }
            answer.append(c)
        }
        answer.append(s)
    }
    return answer.isEmpty ? 1 : 0
}
