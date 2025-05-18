import Foundation

func solution(_ arr:[Int]) -> [Int] {
    
    var answer = arr
    answer.remove(at: answer.firstIndex(of: answer.min()!)!)
    return answer.isEmpty ? [-1] : answer
    
}
