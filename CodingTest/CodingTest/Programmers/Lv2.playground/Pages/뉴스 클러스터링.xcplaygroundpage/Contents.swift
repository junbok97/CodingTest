import Foundation

func solution(_ str1:String, _ str2:String) -> Int {

    let alphabet = "abcdefghijklmnopqrstuvwxyz"

    let lowerStr1 = str1.lowercased().map { $0 }
    let lowerStr2 = str2.lowercased().map { $0 }

    var set1 = [String]()
    var set2 = [String]()

    var union = [String]()
    var intersection = [String]()

    for i in 0..<lowerStr1.count-1 {
        let ch1 = lowerStr1[i]
        let ch2 = lowerStr1[i+1]

        if alphabet.contains(ch1), alphabet.contains(ch2) {
            set1.append("\(ch1)\(ch2)")
        }
    }


    for i in 0..<lowerStr2.count-1 {
        let ch1 = lowerStr2[i]
        let ch2 = lowerStr2[i+1]

        if alphabet.contains(ch1), alphabet.contains(ch2) {
            let str = "\(ch1)\(ch2)"
            set2.append(str)
            if set1.contains(str) {
                intersection.append(str)
                set1.remove(at: set1.firstIndex(of: str)!)
                set2.remove(at: set2.firstIndex(of: str)!)
            }
        }
    }

    union = set1 + set2 + intersection
    
    return intersection.isEmpty && union.isEmpty ? 65536 :Int(Double(intersection.count)/Double(union.count)*65536)
}

solution("E=M*C^2", "e=m*c^2")


//import Foundation
//
//let MULTIPLE: Double = 65536.0
//
//func createStrArray(_ str: String) -> [String] {
//    let alphabet = "abcdefghijklmnopqrstuvwxyz"
//    let str = Array(str).map { String($0) }
//
//    var results: [String] = []
//    for i in 0..<str.count-1 {
//        let ch1 = str[i].lowercased()
//        let ch2 = str[i+1].lowercased()
//        guard alphabet.contains(ch1), alphabet.contains(ch2) else {
//            continue
//        }
//
//        results.append(ch1 + ch2)
//    }
//
//    return results
//}
//
//func createIntersection(_ arr1: [String], _ arr2: [String]) -> [String] {
//    var result: [String] = []
//
//    var temp = arr2
//    arr1.forEach {
//        if let index = temp.firstIndex(of: $0) {
//            temp.remove(at: index)
//            result.append($0)
//        }
//    }
//
//    return result
//}
//
//func createUnion(_ arr1: [String], _ arr2: [String]) -> [String] {
//    var result: [String] = []
//
//    var temp = arr2
//    arr1.forEach {
//        if let index = temp.firstIndex(of: $0) {
//            temp.remove(at: index)
//        }
//    }
//    result.append(contentsOf: arr1)
//    result.append(contentsOf: temp)
//
//    return result
//
//}
//
//func solution(_ str1:String, _ str2:String) -> Int {
//    var result: Double = 1.0
//
//    let str1Arr: [String] = createStrArray(str1)
//    let str2Arr: [String] = createStrArray(str2)
//
//    let intersection: [String] = createIntersection(str1Arr, str2Arr) //교집합
//    let union: [String] = createUnion(str1Arr, str2Arr) //합집합
//
//    if !(intersection.isEmpty && union.isEmpty) {
//        result = Double(intersection.count) / Double(union.count)
//    }
//
//    return Int(floor(result * MULTIPLE))
//}
