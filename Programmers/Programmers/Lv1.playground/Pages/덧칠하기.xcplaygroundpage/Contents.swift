import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    
    var paint = section[0] - 1
    var count = 0
    
    section.forEach {
        if paint < $0 {
            paint = $0 + m - 1
            count += 1
        }
    }
    
    return count

}
