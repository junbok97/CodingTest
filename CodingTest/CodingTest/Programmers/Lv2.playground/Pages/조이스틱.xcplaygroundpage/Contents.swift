import Foundation

// -------- 방법1 -------- //
func solution(_ name:String) -> Int {
    
    var visited: [Bool] = Array(repeating: false, count: name.count)
    
    let result = name.enumerated().compactMap {
        if $0.element != "A" {
            let ascii = $0.element.asciiValue!
            return Int(min(ascii - 65, 91-ascii))
        } else {
            visited[$0.offset] = true
            return nil
        }
    }.reduce(0, +)
    
    var move: [Int] = []
    
    
    func dfs(visited: [Bool], index: Int, count: Int) {
        var visited = visited
        var index = index
        var count = count
        
        if name.count - 1 < count { return }
        if index < 0 { index = name.count - 1 }
        if index > name.count - 1 { index = 0 }
        
        visited[index] = true
        
        if !visited.contains(false) {
            move.append(count)
            return
        }

        count += 1
        dfs(visited: visited, index: index + 1, count: count)
        dfs(visited: visited, index: index - 1, count: count)
    }
    
    dfs(visited: visited, index: 0, count: 0)
    
    return result + move.min()!
}
// -------- 방법1 -------- //



// -------- 방법2 -------- //
func solution2(_ name:String) -> Int {
    var ans = 0
    let name = name.map({$0})
    for i in 0..<name.count {
        if name[i] != "A" {
            let up = name[i].asciiValue! - 65
            let down = 91 - name[i].asciiValue!
            ans += Int((up<down) ? up : down)
        }
    }
    
    /*
     조이스틱을 왼쪽 오른쪽으로 이동가능.
     즉 문자가 아무리 많던 가운데 A가 있을때 A를 제외한 양쪽끝의 문자의 이동거리를 비교하면 되는 것
     예시 1) ABAAACA 일때 가운데 AAA를 기준으로 양쪽끝 BC의 이동거리를 비교하면됨
     순서대로 이동했을시 0123456 역으로 이동시 01065
     예시 2) AABCAAADA 일때 가운데 AAAAAA를 기준으로 양쪽끝 CD의 이동거리를 비교
     정상적으로 이동시 0123456789 역으로 이동시 012321098
     i(name[i] 까지 오는 거리) + i(다시 왼쪽끝으로 이동하는 거리) + name.count - next(반대쪽 끝의 문자까지 이동하는 거리)
     */
    
    var minMove = name.count-1
    for i in 0..<name.count {
        if name[i] != "A" {
            var next = i + 1
            while next<name.count && name[next] == "A" {
                next += 1
            }
            let move = 2 * i + name.count - next
            
            minMove = min(move, minMove)
        }
    }
    return ans + minMove
}
// -------- 방법2 -------- //
