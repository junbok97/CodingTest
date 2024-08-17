import Foundation

func solution(_ elements:[Int]) -> Int {
    var answer: Set<Int> = []
    
    for i in 1...elements.count {
        for j in 0..<elements.count {
            var sum = 0
            for k in 0..<i {
                if (j + k) < elements.count { sum += elements[j + k] }
                else { sum += elements[j + k - elements.count] }
            }
            answer.insert(sum)
        }
    }
        
    return answer.count
}
