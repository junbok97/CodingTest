import Foundation

func solution(_ numbers:[Int], _ direction:String) -> [Int] {
    var numbers = numbers
    if direction == "right" {
        let element = numbers.removeLast()
        numbers.insert(element, at: 0)
    } else {
        let element = numbers.removeFirst()
        numbers.append(element)
    }
    
    return numbers
}
