import Foundation

func solution(_ babbling:[String]) -> Int {
    
    var result = [String]()
    
    for babble in babbling {
        var element = babble
        element = element.replacingOccurrences(of: "aya", with: "1")
        element = element.replacingOccurrences(of: "ye", with: "2")
        element = element.replacingOccurrences(of: "woo", with: "3")
        element = element.replacingOccurrences(of: "ma", with: "4")
        result.append(element)
    }
    
    return result.compactMap {Int($0)}.count
}

solution(["aya", "yee", "u", "maa", "wyeoo"])




