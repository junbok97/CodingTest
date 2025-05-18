import Foundation

func solution(_ sides:[Int]) -> Int {
    let sides = sides.sorted()
    return sides[0] + sides[1] > sides[2] ? 1 : 2
}
