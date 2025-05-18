import Foundation


func solution(_ my_string:String) -> Int {
    
    var result = [String]()
    
    my_string.components(separatedBy: " ").forEach {
        let str = String($0)
        
        if result.count < 2 {
            result.append(str)
        } else {
            let operation = result.removeLast()
            let num = result.removeLast()
            var tmp = ""
            switch operation {
            case "+" :
                tmp = String(Int(num)! + Int(str)!)
            case "-" :
                tmp = String(Int(num)! - Int(str)!)
            default :
                break
            }
            result.append(tmp)
        }
    }
    
    return Int(result.removeLast())!
}

solution("3 + 4")

//func solution(_ my_string:String) -> Int {
//
//    let numbers = my_string.components(separatedBy: " ").compactMap { Int(String($0)) }
//    let operations = my_string.components(separatedBy: " ").filter { Int(String($0)) == nil }
//
//    var result = numbers[0]
//
//    for i in 1..<numbers.count {
//        switch operations[i - 1] {
//        case "+" :
//            result += numbers[i]
//        case "-" :
//            result -= numbers[i]
//        default :
//            continue
//        }
//    }
//
//    return result
//}




