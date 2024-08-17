import Foundation

func solution(_ my_string:String) -> Int {
    return my_string.map {
        $0.isNumber ? String($0) : " "
    }.joined().components(separatedBy: " ").map {
        Int(String($0)) ?? 0
    }.reduce(0, +)
}

solution("aAb1B2cC34oO1")
