import Foundation

func sliceString(_ n: Int, _ str: String) -> [String] {
    var result: [String] = []
    var tmp = ""
    
    for char in str {
        tmp += String(char)
        if n <= tmp.count {
            result.append(tmp)
            tmp = ""
        }
    }
    if tmp != "" {
        result.append(tmp)
    }
    
    return result
}

func compressString(_ array: [String]) -> String {
    var result: String = ""
    var tmp = ""
    var count = 1
    
    for str in array {
        if tmp == str {
            count += 1
        } else {
            if tmp != "" {
                result += (count > 1) ? "\(count)\(tmp)" : "\(tmp)"
            }
            tmp = str
            count = 1
        }
    }
    
    if tmp != "" {
        result += (count > 1) ? "\(count)\(tmp)" : "\(tmp)"
    }
    
    return result
}

func solution(_ s:String) -> Int {
    if s.count < 3 { return s.count }
    
    var result: Int = s.count
    
    for n in 1...s.count/2 {
        let slicedString = sliceString(n, s)
        let compressedString = compressString(slicedString)
        let length = compressedString.count
        if length < result {
            result = length
        }
    }
    
    return result
}
