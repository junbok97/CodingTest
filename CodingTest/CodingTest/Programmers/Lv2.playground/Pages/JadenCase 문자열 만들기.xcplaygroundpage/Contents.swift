import Foundation

func solution(_ s:String) -> String {
    
    let strArray = s.lowercased().components(separatedBy: " ")
    var newArray =  [String]()
    
    for str in strArray {
        if str == "" {
            newArray.append(str)
            continue
        }
        var str = str
        let c = str.first?.uppercased()
        str.removeFirst()
        newArray.append("\(c!)\(str)")
    }
    
    return newArray.joined(separator: " ")
}
