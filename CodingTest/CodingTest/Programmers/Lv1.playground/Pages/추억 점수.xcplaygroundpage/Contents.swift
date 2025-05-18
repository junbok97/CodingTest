import Foundation

func solution1(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    let score: [String: Int] = Dictionary(uniqueKeysWithValues: zip(name, yearning))
    
    return photo.map { $0.reduce(0) { $0 + (score[$1] ?? 0) } }
}

func solution2(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    return photo.map { $0.compactMap { name.firstIndex(of: $0) }.map { yearning[$0] }.reduce(0, +) }
}

solution1(
    ["may", "kein", "kain", "radi"],
    [5, 10, 1, 3],
    [["may", "kein", "kain", "radi"],["may", "kein", "brin", "deny"], ["kon", "kain", "may", "coni"]]
)
