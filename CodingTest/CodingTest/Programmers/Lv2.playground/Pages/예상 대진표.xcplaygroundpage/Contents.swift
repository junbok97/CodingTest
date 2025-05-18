import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var n = n
    var a = a
    var b = b
    var answer = 0
    
    while 0 < n {
        answer += 1
        a += 1
        b += 1
        a /= 2
        b /= 2
        n /= 2
        
        if a == b {
            break
        }
    }
//    
//    repeat {
//        a = (a + 1) / 2
//        b = (b + 1) / 2
//        answer += 1
//    } while a != b
        
    return answer
}


