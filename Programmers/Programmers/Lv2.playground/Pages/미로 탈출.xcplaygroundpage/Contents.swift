import Foundation

typealias Point = (i: Int, j: Int)

enum Map: String {
    case start = "S"
    case exit = "E"
    case lever = "L"
    case way = "O"
    case wall = "X"
}

var row: Int = 0
var col: Int = 0
var newMaps: [[Map]] = []

func moveMap(_ startPoint: Point, _ targetPoint: Point, _ visited: [[Bool]], _ movedValue: [[Int]]) -> Int {
    var visited = visited
    var movedValue = movedValue
    var queue: [(point: Point, count: Int)] = [(startPoint, 0)]
    
    while !queue.isEmpty {
        let item = queue.removeFirst()
        let point = item.point
        let count = item.count
        if point.i < 0 || row <= point.i || point.j < 0 || col <= point.j || visited[point.i][point.j] || newMaps[point.i][point.j] == .wall { continue }
        movedValue[point.i][point.j] = min(movedValue[point.i][point.j], count)
        if point == targetPoint { continue }
        visited[point.i][point.j] = true
        queue.append(((point.i, point.j + 1), count + 1))
        queue.append(((point.i, point.j - 1), count + 1))
        queue.append(((point.i + 1, point.j), count + 1))
        queue.append(((point.i - 1, point.j), count + 1))
    }
    
    return movedValue[targetPoint.i][targetPoint.j]
}

func solution(_ maps:[String]) -> Int {
    var startPoint: Point = (0,0)
    var leverPoint: Point = (0,0)
    var exitPoint: Point = (0,0)
    
    row = maps.count
    col = maps[0].count
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: col), count: row)
    var movedValue: [[Int]] = Array(repeating: Array(repeating: Int.max, count: col), count: row)
    newMaps = maps.enumerated().map { (i, str) in
        str.enumerated().compactMap { (j, char) in
            let map = Map(rawValue: String(char))
            if map == .start { startPoint = (i,j) }
            if map == .lever { leverPoint = (i,j) }
            if map == .exit { exitPoint = (i,j) }
            return map
        }
    }

    let leverValue = moveMap(startPoint, leverPoint, visited, movedValue)
    if leverValue == Int.max { return -1 }
    let exitValue = moveMap(leverPoint, exitPoint, visited, movedValue)
    if exitValue == Int.max { return -1 }
    return leverValue + exitValue
}
