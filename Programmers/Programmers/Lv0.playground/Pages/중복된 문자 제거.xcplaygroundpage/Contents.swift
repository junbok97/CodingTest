import Foundation

func solution(_ my_string:String) -> String {
    var result = ""
    
    my_string.forEach {
        if !result.contains($0) {
            result += String($0)
        }
    }
    
    return result
}
