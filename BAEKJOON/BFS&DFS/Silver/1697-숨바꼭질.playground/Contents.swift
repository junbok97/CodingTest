import Foundation

typealias Point = (x: Int, y: Int)

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]


let inputs = readLine()!
    .components(separatedBy: " ")
    .compactMap { Int($0) }

let N = inputs[0]
let K = inputs[1]


var arr = Array(repeating: -1, count: 100_001)
var queue = [N]
var index = 0
arr[N] = 0


func bfs() {
    while index < arr.count {
        let x = queue[index]
        index += 1
        
        for nx in [x + 1, x - 1, x * 2] {
            if !(0...100_000 ~= nx) || -1 < arr[nx] { continue }
            arr[nx] = arr[x] + 1
            queue.append(nx)
        }
        
        if arr[K] != -1 {
            print(arr[K])
            return
        }
    }
}

bfs()


