import Foundation

func solution(_ citations:[Int]) -> Int {

    let citations = citations.sorted(by: >)

    for i in 0..<citations.count {
        if citations[i] <= i {
            return i
        }
    }

    return citations.count
}
