import Foundation

func solution(_ dots:[[Int]]) -> Int {
    
    if Double(dots[0][1] - dots[1][1]) / Double(dots[0][0] - dots[1][0]) == Double(dots[2][1] - dots[3][1]) / Double(dots[2][0] - dots[3][0]) { return 1 }
    if Double(dots[0][1] - dots[2][1]) / Double(dots[0][0] - dots[2][0]) == Double(dots[1][1] - dots[3][1]) / Double(dots[1][0] - dots[3][0]) { return 1 }
    if Double(dots[0][1] - dots[3][1]) / Double(dots[0][1] - dots[3][0]) == Double(dots[1][1] - dots[2][1]) / Double(dots[1][0] - dots[2][0]) { return 1 }
 
    return 0
}

solution([[1, 4], [9, 2], [3, 8], [11, 6]])
