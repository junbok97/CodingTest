import Foundation

//func solution(_ s:String) -> [Int] {
//
//    var result = [Character: Int]()
//
//    return s.enumerated().map {
//        var v = -1
//
//        if result[$0.element] == nil {
//            result[$0.element] = $0.offset
//        } else {
//            v = $0.offset - result[$0.element]!
//            result[$0.element] = $0.offset
//        }
//        return v
//    }
//}

func solution(_ s: String) -> [Int] {
    return s.enumerated().map { (i, c) in i - (Array(s)[0..<i].lastIndex(of: c) ?? i + 1)}
}

solution("banana")
