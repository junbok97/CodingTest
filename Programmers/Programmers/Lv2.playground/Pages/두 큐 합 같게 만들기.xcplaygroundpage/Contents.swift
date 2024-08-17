import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    let array = queue1 + queue2
    
    var left = 0
    var right = queue1.count
    var answer = 0
    
    var sum1 = queue1.reduce(0, +)
    var sum2 = queue2.reduce(0, +)
    let goal = (sum1 + sum2) / 2
    
    if (sum1 + sum2) % 2 != 0 { return -1 }
    
    while right < array.count && left <= right {
        if sum1 < goal {
            sum1 += array[right]
            right += 1
        } else if goal < sum1 {
            sum1 -= array[left]
            left += 1
        } else {
            break
        }
        
        answer += 1
    }
    
    return sum1 == goal ? answer : -1
}
