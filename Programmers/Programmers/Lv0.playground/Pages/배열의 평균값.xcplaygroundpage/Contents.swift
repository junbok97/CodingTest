import Foundation

func solution(_ numbers:[Int]) -> Double {
    return Double(numbers.reduce(0, +)) / Double(numbers.count)
    
//    return numbers.reduce(0.0) { result, element in
//        return result + Double(element) / Double(numbers.count)
//    }
}
