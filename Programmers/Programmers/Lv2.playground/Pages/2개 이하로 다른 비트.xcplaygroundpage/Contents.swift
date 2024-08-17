import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {
    return numbers.map { number in
        if number % 2 == 0 { return number + 1 }
        else {
            let binary = (~number) & (number + 1)
            return (number | binary) & ~(binary >> 1)
        }
    }
}
