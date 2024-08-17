import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    let filtered = "abcdefghijklmnopqrstuvwxyz".filter { !skip.contains($0) }.map { $0 }
    let maps = filtered.enumerated().reduce(into: [:]) { dict, v in
        dict[v.element] = filtered[(v.offset+index) % filtered.count]
    }

    return s.map { String(maps[$0]!) }.joined()
}

solution("z", "abcdefghij", 20)

//func solution(_ s:String, _ skip:String, _ index:Int) -> String {
//
//    var alph = Set("abcdefghijklmnopqrstuvwxyz".map { String($0) })
//    var skip = Set(skip.map { String($0) })
//    var result = Array(alph.subtracting(skip)).sorted()
//
//    return s.map {
//        (result.firstIndex(of: String($0))! + index) % result.count
//    }.map {
//        result[$0]
//    }.joined()
//}



