import Foundation

func solution(_ angle:Int) -> Int {
    if angle == 180 {
        return 4
    } else if angle > 90 {
        return 3
    } else if angle == 90 {
        return 2
    } else {
        return 1
    }
    return 0
}
