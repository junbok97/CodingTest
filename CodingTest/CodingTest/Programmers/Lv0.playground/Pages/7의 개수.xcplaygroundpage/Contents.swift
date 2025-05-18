import Foundation

func solution(_ array:[Int]) -> Int {
    array.map{String($0).filter {$0 == "7"}.count}.reduce(0, +)
}
