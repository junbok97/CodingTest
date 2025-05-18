import Foundation

func solution(_ num_list:[Int]) -> [Int] {
    let count = num_list.filter { $0 % 2 == 0 }.count
    return [count, num_list.count - count]
}
