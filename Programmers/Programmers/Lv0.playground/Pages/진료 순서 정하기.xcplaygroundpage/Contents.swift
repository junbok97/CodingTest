import Foundation

func solution(_ emergency:[Int]) -> [Int] {
    emergency.map { emergency.sorted(by: >).firstIndex(of: $0)! + 1 }
}

solution([3,76,24])
