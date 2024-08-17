import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var result = 0
    var visited: [Bool] = Array(repeating: false, count: dungeons.count)
    
    func dfs(_ index: Int, _ tired: Int, _ depth: Int) {
        var tired = tired
        visited[index] = true
        tired -= dungeons[index][1]
        for i in 0..<dungeons.count {
            if !visited[i] && dungeons[i][0] <= tired { dfs(i, tired, depth + 1) }
        }
        result = max(result, depth)
        visited[index] = false
    }
    
    for i in 0..<dungeons.count {
        if dungeons[i][0] <= k { dfs(i, k, 1) }
    }

    return result
}

func solution2(_ k: Int, _ dungeons: [[Int]]) -> Int {
    return explore(k, dungeons, 0)
}

private func explore(_ k: Int, _ dungeons: [[Int]], _ depth: Int) -> Int {
    return dungeons.map { dungeon in
        k >= dungeon[0] ? explore(k - dungeon[1], dungeons.filter { elem in dungeon != elem }, depth + 1) : depth
    }.max() ?? depth
}
