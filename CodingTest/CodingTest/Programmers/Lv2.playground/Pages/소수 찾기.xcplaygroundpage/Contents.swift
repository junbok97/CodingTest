import Foundation

func solution(_ numbers:String) -> Int {
    
    var numbers = numbers.map { String($0) }.sorted(by: >)
    let max = Int(numbers.joined())!

    if max < 2 { return 0 }
    if max < 4 { return 1 }

    var result: Set<Int> = []
    var isPrime: [Bool] = Array(repeating: true, count: max + 1)
    var visited: [Bool] = Array(repeating: false, count: numbers.count)
    
    isPrime[0] = false
    isPrime[1] = false

    for i in 2...max {
        var j = 2
        while i*j <= max {
            isPrime[i * j] = false
            j += 1
        }
    }
    
    func dfs(_ visited: [Bool], _ str: String) {
        if !visited.contains(false) { return }
        
        var visited = visited
        
        for i in 0..<visited.count {
            if visited[i] { continue }
            visited[i] = true
            let newStr = str + numbers[i]
            if isPrime[Int(newStr)!] { result.insert(Int(newStr)!) }
            dfs(visited, newStr)
            visited[i] = false
        }
        
    }
    
    dfs(visited, "")
    
    return result.count
}
