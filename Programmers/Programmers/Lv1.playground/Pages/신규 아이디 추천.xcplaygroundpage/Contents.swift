import Foundation

func solution(_ new_id:String) -> String {
    
    var result = new_id.lowercased().components(separatedBy: ["~", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "=", "+", "[", "]", "{", "}", ":", "?", ",", "<", ">", "/"]).joined().components(separatedBy: ".").filter { $0 != ""
    }.joined(separator: ".").trimmingCharacters(in: ["."])
  
    
    if result.isEmpty {
        result = "a"
    }
    
    if 15 <= result.count {
        result = "\(result.prefix(15))"
    }
    
    result = result.trimmingCharacters(in: ["."])
    
    if result.count <= 2 {
        result += String.init(repeating: "\(result.last!)", count: 3-result.count)
    }
    
    return result
}

solution("z-+.^")
