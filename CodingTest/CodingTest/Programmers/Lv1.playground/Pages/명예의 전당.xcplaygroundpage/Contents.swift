import Foundation

// k 일 이전 : 제일 작은 수
// k 일 이후 : 제일 작은 수 보다 큰 수
func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var answer: [Int] = []
    var newScore: [Int] = []

    for index in 0..<score.count {
        newScore.append(score[index])
        newScore.sort(by: >)
        if newScore.count < k {
            answer.append(newScore.last!)
        } else {
            answer.append(newScore[k - 1])
        }
    }

    return answer
}

solution(3, [10, 100, 20, 150, 1, 100, 200])
