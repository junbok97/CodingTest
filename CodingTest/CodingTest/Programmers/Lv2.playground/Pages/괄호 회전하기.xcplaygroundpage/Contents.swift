import Foundation

func solution(_ s:String) -> Int {
    
    var count = 0
    var s = s
    
    for _ in 0..<s.count {
        var str = s
        var queue = [Character]()
        
        
        for c in str {
            if queue.isEmpty {
                queue.append(c)
            } else {
                guard let last = queue.last else {
                    continue
                }
                switch last {
                case "[" : if c == "]" { queue.removeLast() } else { queue.append(c) }
                case "(" : if c == ")" { queue.removeLast() } else { queue.append(c) }
                case "{" : if c == "}" { queue.removeLast() } else { queue.append(c) }
                default :
                    queue.append(c)
                }
            }
        }
        
        if queue.isEmpty {
            count += 1
        }
        let tmp = String(s.first!)
        s.removeFirst()
        s.append(tmp)
        
    }
    
    return  count
}

solution("{}]()[")
