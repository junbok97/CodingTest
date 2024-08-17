import Foundation

func checkDistance(_ places: [String]) -> Int {
    
    let place: [[String]] = places.map { $0.map { String($0) } }
    var points: [(i: Int, j: Int)] = []
    
    // 좌표 저장
    for i in 0..<5 {
        for j in 0..<5 {
            if place[i][j] == "P" { points.append((i,j))}
        }
    }
    
    if points.count < 2 { return 1 }
    
    // 좌표 비교
    for i in 0..<points.count-1 {
        for j in i+1..<points.count {
            let first = points[i]
            let second = points[j]
            let distance = abs(first.i - second.i) + abs(first.j - second.j)
            if distance < 2 { return 0 }
            if distance == 2 {
                
                // 101
                if first.i == second.i {
                    if place[first.i][first.j+1] != "X" { return 0 } else { continue }
                }
                
                // 0
                // 1
                // 0
                if first.j == second.j {
                    if place[first.i+1][first.j] != "X" { return 0 } else { continue }
                }
                
                // 10
                // 01
                if first.j < second.j {
                    if place[first.i][second.j] != "X" || place[second.i][first.j] != "X" { return 0 } else { continue }
                }

                // 01
                // 10
                if first.j > second.j {
                    if place[second.i][first.j] != "X" || place[first.i][second.j] != "X" { return 0 } else { continue }
                }
            }
        }
    }
    
    return 1
}

func solution(_ places:[[String]]) -> [Int] {
    
    var result: [Int] = []
    
    places.forEach { result.append(checkDistance($0)) }
    
    return result
}
