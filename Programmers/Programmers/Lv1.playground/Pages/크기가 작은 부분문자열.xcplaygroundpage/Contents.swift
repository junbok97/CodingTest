import Foundation

func solution(_ t:String, _ p:String) -> Int {
    var index = 0
    var result = [String]()
    
    var t = Array(t).map { String($0)}
    
    
    
    while index + p.count <= t.count {
        result.append(t[index..<index+p.count].joined())
        index += 1
    }
    
    return result.filter {$0 <= p}.count
}


//func solution(_ t:String, _ p:String) -> Int {
//    var answer = 0
//
//    for i in 0 ... t.count - p.count {
//        let subStr = t.dropFirst(i).prefix(p.count)
//        if let comp = Int(subStr), let val = Int(p) {
//            answer += comp - val <= 0 ? 1 : 0
//        }
//    }
//
//    return answer
//}
