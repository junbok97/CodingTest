import Foundation

func solution(_ userIds:[String], _ bannedIds:[String]) -> Int {
    
    var bannedIds = bannedIds
    var dict: [String: [String]] = [:]
    var regularExps = bannedIds.map { "^\($0.replacingOccurrences(of: "*", with: "[\\w]"))$" }
    var visited: [Bool] = Array(repeating: false, count: userIds.count)
    var userIdsDict: [String: Int] = [:]
    var result: Set<[String]> = []
    
    for (index, value) in userIds.enumerated() {
        userIdsDict[value] = index
    }
    
    for i in 0..<bannedIds.count {
        dict[bannedIds[i]] = userIds.filter { $0.range(of: regularExps[i], options: .regularExpression) != nil }
    }
    
    
    func dfs(_ answer: [String], _ visited: [Bool], _ bannedIds: [String]) {
        var visited = visited
        var bannedIds = bannedIds
        if bannedIds.isEmpty {
            result.insert(answer.sorted())
            return
        }
        let bannedId = bannedIds.removeFirst()
        
        for targetId in dict[bannedId]! {
            if visited[userIdsDict[targetId]!] {
                continue
            } else {
                visited[userIdsDict[targetId]!] = true
                dfs(answer + [targetId], visited, bannedIds)
                visited[userIdsDict[targetId]!] = false
            }
        }
        return
    }

    dfs([], visited, bannedIds)

    return result.count
}


solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "*rodo", "******", "******"])


//let str = "frodo"
//let reg = "^fr[\\w]d[\\w]$"
//
//if let _ = str.range(of: reg, options: .regularExpression) {
//    print("유효")
//}
