import Foundation

func solution(_ s:String) -> String {
    let nums = s.components(separatedBy: " ").map { Int($0)! }
    return "\(nums.min()!) \(nums.max()!)"
}
