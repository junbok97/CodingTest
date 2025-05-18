import Foundation

func solution(_ lines:[[Int]]) -> Int {
    
    var wholeLine = Array(repeating: 0, count: 200)
    
    for line in lines {
        for idx in stride(from: line.first!, to: line.last!, by: 1) {
            wholeLine[idx] += 1
        }
    }

    return wholeLine.filter { $0 >= 2 }.count
}

solution([[0, 5], [3, 9], [1, 10]])



//func solution(_ lines:[[Int]]) -> Int {
//
//    var result = [[Int]]()
//    var lines = lines.sorted { $0[1] < $1[1] }.sorted{ $0[0] < $1[0] }
//
//    lines
//
//    if lines[1][0] < lines[0][1] {
//        result.append(lines[0][1] < lines[1][1] ? [lines[1][0], lines[0][1]] : lines[1])
//    }
//    if lines[2][0] < lines[1][1] {
//        result.append(lines[1][1] < lines[2][1] ? [lines[2][0], lines[1][1]] : lines[2])
//    }
//    if lines[1][1] < lines[0][1] {
//        result.append(lines[1])
//    }
//    if lines[2][1] < lines[0][1] {
//        result.append(lines[2])
//    }
//    if lines[2][1] < lines[1][1] {
//        result.append(lines[2])
//    }
//
//    Set(result)
//
//    return 0
//
//}
