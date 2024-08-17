import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var stack: [Int] = []
    var result: [Int] = Array(repeating: -1, count: numbers.count)
    
    for i in 0..<numbers.count{
        while !stack.isEmpty && numbers[stack.last!] < numbers[i]{
            result[stack.popLast()!] = numbers[i]
        }
        stack.append(i)
    }

    return result}
