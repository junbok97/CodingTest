import Foundation

func solution(_ babbling:[String]) -> Int {
    var count: Int = 0
    for element in babbling {
        var str = String(element)
        str = str.replacingOccurrences(of: "aya", with: "1")
        str = str.replacingOccurrences(of: "ye", with: "2")
        str = str.replacingOccurrences(of: "woo", with: "3")
        str = str.replacingOccurrences(of: "ma", with: "4")
        if Int(str) != nil && !str.contains("11") && !str.contains("22") && !str.contains("33") && !str.contains("44"){
            count += 1
        }
    }
    return count
}



//func solution(_ babbling:[String]) -> Int {
//
//    var result = [String]()
//
//    for babble in babbling {
//        var element = babble
//        element = element.replacingOccurrences(of: "aya", with: "1")
//        element = element.replacingOccurrences(of: "ye", with: "2")
//        element = element.replacingOccurrences(of: "woo", with: "3")
//        element = element.replacingOccurrences(of: "ma", with: "4")
//        result.append(element)
//    }
//
//    return result.compactMap{Int($0)}.filter {
//        var element = String($0)
//        element = element.replacingOccurrences(of: "11", with: "1")
//        element = element.replacingOccurrences(of: "22", with: "2")
//        element = element.replacingOccurrences(of: "33", with: "3")
//        element = element.replacingOccurrences(of: "44", with: "4")
//        return element.count == String($0).count
//    }.count
//}

solution(["ayaye", "uuu", "yeye", "yemawoo", "ayaayaa"])




