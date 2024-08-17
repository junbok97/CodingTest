import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var graph: [Int: [Int]] = [:]
    var visited: [Bool] = []
    var result = n
    
    (1...n).forEach { graph.updateValue([], forKey: $0) }

    for wire in wires {
        graph[wire[0]]?.append(wire[1])
        graph[wire[1]]?.append(wire[0])
    }

    func bfs(_ start: Int) -> Int {
        var queue: [Int] = [start]
        var index = 0

        while index < queue.count {
            let last = queue[index]
            index += 1

            visited[last] = true
            for node in graph[last]! {
                if !visited[node] {
                    queue.append(node)
                }
            }
        }

        return index
    }
    
    for i in 1...n {
        visited = Array(repeating: false, count: n+1)
        visited[i] = true
        let count = bfs(1)
        result = min(result, abs(count - (n - count)))
    }
    
    return result
}


solution(9, [[1,3],[2,3],[3,4],[4,5],[4,6],[4,7],[7,8],[7,9]])
