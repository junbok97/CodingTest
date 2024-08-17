import Foundation

func solution(_ s:String) -> [Int] {
    
    var result = [String : Int]()
    var s = s
    s.removeFirst()
    s.removeLast()
    
    var tmp = s.components(separatedBy: ["{","}",","]).filter { $0 != "" }
    
    Set<String>(tmp).map {
        result[$0] = 0
    }
    
    tmp.forEach {
        result[$0]! += 1
    }

    return  result.sorted {
        $0.1 > $1.1
    }.map {
        Int($0.0)!
    }
}

solution("{{2},{2,1},{2,1,3},{2,1,3,4}}")
