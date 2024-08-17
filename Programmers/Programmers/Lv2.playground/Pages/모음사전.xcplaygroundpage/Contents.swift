import Foundation

func solution(_ word:String) -> Int {
    var answer = 0
    var cases = [781, 156, 31, 6, 1]
    let words = word.map { char -> Int in
        switch char {
        case "A":
            return 0
        case "E":
            return 1
        case "I":
            return 2
        case "O":
            return 3
        default:
             return 4
        }
    }
    
    for word in words {
        answer += cases.removeFirst() * word + 1
    }
    
    return answer
}
