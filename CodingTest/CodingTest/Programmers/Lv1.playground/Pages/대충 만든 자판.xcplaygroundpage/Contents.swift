import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    
    return targets.map { target in
        let result = target.map { char in
            keymap.compactMap { key -> Int? in
                guard let firstIndex = key.firstIndex(of: char) else { return nil }
                return key.distance(from: key.startIndex, to: firstIndex) + 1
            }
        }.compactMap { $0.min() }
        
        return result.count == target.count ? result.reduce(0, +) : -1
    }
}

solution(["ABACD", "BCEFD"], ["ABCD","AABB"])
