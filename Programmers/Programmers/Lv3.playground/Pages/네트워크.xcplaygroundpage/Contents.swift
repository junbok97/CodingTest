import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    var answer: Int = 0
    var visited: [Bool] = Array(repeating: false, count: n)
    
    func dfs(_ vertex: Int) {
        visited[vertex] = true
        
        for index in 0..<n {
            if computers[vertex][index] == 1 && visited[index] == false {
                dfs(index)
            }
        }
    }
    
    for index in 0..<n {
        if !visited[index] {
            answer += 1
            dfs(index)
        }
    }
    
    return answer
}


solution(3, [[1, 1, 1], [1, 1, 1], [1, 1, 1]])
