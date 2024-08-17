import Foundation

func solution(_ sticker:[Int]) -> Int{
    
    if sticker.count == 1 {
        return sticker[0]
    }
    
    var p1 = 0
    var p2 = 0
    var maxSum = 0
    var answer = 0

    for i in 0..<sticker.count-1 {
        maxSum = max(p2 + sticker[i], p1)
        p2 = p1
        p1 = maxSum
    }
    
    answer = answer < maxSum ? maxSum : answer

    p1 = 0
    p2 = 0
    maxSum = 0
    for i in 1..<sticker.count {
        maxSum = max(p2 + sticker[i], p1)
        p2 = p1
        p1 = maxSum
    }

    answer = answer < maxSum ? maxSum : answer
    
    return answer
}
