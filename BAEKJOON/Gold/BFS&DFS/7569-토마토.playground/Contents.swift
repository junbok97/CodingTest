// https://www.acmicpc.net/problem/7569
import Foundation

var demessions = readLine()!
    .split(separator: " ")
    .compactMap { Int($0) }

let X = demessions[1]
let Y = demessions[0]
let Z = demessions[2]

print(BFS(X, Y, Z))


func BFS(_ X: Int, _ Y: Int, _ Z: Int) -> Int {
    
    let dir: [(x: Int, y: Int, z: Int)] = [(1, 0, 0), (-1, 0, 0), (0, 1, 0), (0, -1, 0), (0, 0, 1), (0, 0, -1)]
    
    var queue: [(Int, Int, Int)] = []
    var warehouse = Array(
        repeating: Array(
            repeating: Array(
                repeating: 0,
                count: Y),
            count: X),
        count: Z)
    
    
    for z in 0..<Z {
        for x in 0..<X {
            let inputs = readLine()!.split(separator: " ")
            for y in 0..<Y {
                let num = Int(inputs[y])!
                if num == 1 { queue.append((x, y, z)) }
                if num == 0 { warehouse[z][x][y] = -1 }
            }
        }
    }
    
    var index = 0
    while index < queue.count {
        let (x, y, z) = queue[index]
        index += 1
        
        
        for idx in 0..<dir.count {
            let (nx, ny, nz) = (x + dir[idx].x, y + dir[idx].y, z + dir[idx].z)
            
            if (0..<X ~= nx) &&
                (0..<Y ~= ny) &&
                (0..<Z ~= nz) &&
                warehouse[nz][nx][ny] < 0 {
                queue.append((nx, ny, nz))
                warehouse[nz][nx][ny] = warehouse[z][x][y] + 1
            }
        }
        
    }
    
    
    var answer = 0
    for x in 0..<X {
        for y in 0..<Y {
            for z in 0..<Z {
                if warehouse[z][x][y] == -1 { return -1 }
                answer = max(answer, warehouse[z][x][y])
            }
        }
    }
    
    return answer
    
}
