import Foundation

func solution(_ s:String) -> Bool
{
    var left = 0
    var right = 0
    
    for c in s {
        switch c {
        case "(" :
            left += 1
        case ")" :
            right += 1
        default:
            continue
        }
        if right > left {
            return false
        }
    }
    
    return left == right ? true :false
}
