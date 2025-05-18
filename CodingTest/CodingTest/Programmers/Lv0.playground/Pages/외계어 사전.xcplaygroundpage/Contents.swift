import Foundation

func solution(_ spell:[String], _ dic:[String]) -> Int {
    dic.map { String($0.sorted()) }.contains(spell.sorted().joined()) ? 1 : 2
}

solution(["s", "o", "m", "d"], ["moos", "dzx", "smm", "sunmmo", "som"])

