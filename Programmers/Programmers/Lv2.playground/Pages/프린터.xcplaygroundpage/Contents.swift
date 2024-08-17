import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var result = 0
    var priority : [(Int,Int)] = priorities.enumerated().map { ($0.offset, $0.element)}

    while !priority.isEmpty {
        let first = priority.removeFirst()
        if !priority.filter({ first.1 < $0.1 }).isEmpty {
            priority.append(first)
        } else if first.0 == location {
            result = priorities.count - priority.count
        }
    }
    
    
//    while !priority.isEmpty {
//        let max = priority.max { $0.1 < $1.1 }!
//        let first = priority.removeFirst()
//
//        if max.1 == first.1 {
//            result += 1
//            if first.0 == location {
//                break
//            }
//        } else {
//            priority.append(first)
//        }
//    }
//
    return result
 }

solution([2, 1, 3, 2], 2)

