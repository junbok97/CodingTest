import Foundation

func solution(_ n:Int) -> Int
{
    var n = n
    var ans:Int = 0
    
    while 0 < n {
        if n % 2 != 0 {
            ans += 1
        }
        n /= 2
    }

    return ans
}
