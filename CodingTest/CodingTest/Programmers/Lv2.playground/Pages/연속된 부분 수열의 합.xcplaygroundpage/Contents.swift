import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    var left = 0
    var right = 0
    var sum = sequence[0]
    var length = sequence.count
    var result = [sequence.count + 1, sequence.count + 1]
    
    while left < sequence.count && right < sequence.count {
        let newLength = right - left
        if sum == k && newLength <= length {
            if !(length == newLength && result[0] < left) {
                length = newLength
                result = [left, right]
            }
        }
        
        if sum <= k {
            right += 1
            if right == sequence.count { break }
            sum += sequence[right]
        } else {
            sum -= sequence[left]
            left += 1
        }
    }
    
    return result
}


// 시간초과
func solution2(_ sequence:[Int], _ k:Int) -> [Int] {
    var sum = 0
    var count = sequence.count
    var queue: [Int] = []
    var result: [Int] = [sequence.count + 1, sequence.count + 1]

    for index in 0..<sequence.count {
        queue.append(sequence[index])
        sum += sequence[index]

        while k < sum { sum -= queue.remove(at: 0) }

        if sum == k && queue.count <= count  {
            let newResult = [index - queue.count + 1, index]
            if count == queue.count && result[0] < newResult[0] && result[1] < newResult[1] { continue }
            count = queue.count
            result = newResult
        }
    }

    return result
}


solution([1,1,1,1,1,1,1], 1)
// [0,0]

solution([1, 1, 1, 2, 3, 4, 5], 5)
// [6,6]
