import Foundation

func solution(_ sides:[Int]) -> Int {
    
    let sides = sides.sorted()
    let min = sides[0]
    let max = sides[1]
    let sum = sides.reduce(0, +)
    
    var count = 0
    
    // sides의 max가 가장 긴변일때
    // 나머지 한변 <= max
    // 나머지 한변 + min > max
    for i in 1...max {
        if i + min > max {
            count += 1
        }
    }
    
    // 나머지 한변이 가장 긴변일때
    // max < 나머지 한변 < sum
    for _ in (max+1)..<sum {
        count += 1
    }
    
    return count
}
