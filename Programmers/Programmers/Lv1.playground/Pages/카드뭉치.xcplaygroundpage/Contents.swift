import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    let error = cards1.count + cards2.count + goal.count
    let index1 = cards1.map { goal.firstIndex(of: $0) ?? error }
    let index2 = cards2.map { goal.firstIndex(of: $0) ?? error }
    let result1 = index1.sorted(by: <)
    let result2 = index2.sorted(by: <)
    return index1 == result1 && index2 == result2 ? "Yes" : "No"
}

solution(
    ["a", "b", "c"],
    ["d", "e"],
    ["b", "e"]
)
