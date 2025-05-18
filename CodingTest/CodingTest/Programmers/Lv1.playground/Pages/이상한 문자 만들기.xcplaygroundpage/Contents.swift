import Foundation

func solution(_ s:String) -> String {
    
    
    return s.components(separatedBy: " ").map {
        $0.enumerated().map {
            $0.offset % 2 == 0 ? $0.element.uppercased() : $0.element.lowercased()
        }
    }.map { $0.joined() }.joined(separator: " ")
    
    
//    var arr = [String]()
//
//    s.components(separatedBy: " ").map {
//        var result = ""
//        for (i, v) in Array($0.uppercased()).enumerated() {
//            if i % 2 != 0 {
//                result += v.lowercased()
//            } else {
//                result += String(v)
//            }
//        }
//        arr.append(result)
//    }
//
//
//    return arr.joined(separator: " ")
}
