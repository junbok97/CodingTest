import Foundation

func solution(_ X:String, _ Y:String) -> String {

    var result = [String]()
    
    for i in 0...9 {
        result += Array(repeating: String(i), count: min(X.filter{String($0) == String(i)}.count, Y.filter {String($0) ==  String(i)}.count))
    }
    
    return result.isEmpty ? "-1" : result.filter{$0 == "0"}.count == result.count ? "0" : result.sorted(by: >).joined()
}

solution("0000000000000000000","0000000000000001111111111111100000")


