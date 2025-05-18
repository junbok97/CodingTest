import Foundation

func solution(_ array:[Int]) -> [Int] {
    [array.max()!, array.index(of: array.max()!)!]
}
