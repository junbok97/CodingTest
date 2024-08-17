import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    // rows * columns 생셩
    var array: [[Int]] = []
    var result: [Int] = []
    
    for i in 0..<rows {
        var tmp: [Int] = []
        for j in 1...columns {
            tmp.append(i * columns + j)
        }
        array.append(tmp)
    }
    
    
    for query in queries {
        let x1 = query[0] - 1, y1 = query[1] - 1
        let x2 = query[2] - 1, y2 = query[3] - 1
        var row = x1, col = y1
        var min = array[row][col]
        var queue: [Int] = [min]
        
        // left
        while col < y2 {
            min = array[row][col] < min ? array[row][col] : min
            queue.append(array[row][col])
            array[row][col] = queue.removeFirst()
            col += 1
        }
        
        // down
        while row < x2 {
            min = array[row][col] < min ? array[row][col] : min
            queue.append(array[row][col])
            array[row][col] = queue.removeFirst()
            row += 1
        }
        
        // right
        while y1 < col {
            min = array[row][col] < min ? array[row][col] : min
            queue.append(array[row][col])
            array[row][col] = queue.removeFirst()
            col -= 1
        }
        
        // up
        while x1 < row {
            min = array[row][col] < min ? array[row][col] : min
            queue.append(array[row][col])
            array[row][col] = queue.removeFirst()
            row -= 1
        }
        
        array[row][col] = queue.removeFirst()
        result.append(min)
    }
    
    return result
}
