import Foundation

func solution(_ quiz:[String]) -> [String] {
    
    var result = [String]()
    
    let quiz = quiz.map { $0.components(separatedBy: " ") }
    
    for q in quiz {
        let answer = Int(q[4])!
        
        switch q[1] {
        case "+": Int(q[0])! + Int(q[2])! == answer ? result.append("O") : result.append("X")
        case "-": Int(q[0])! - Int(q[2])! == answer ? result.append("O") : result.append("X")
        case "*": Int(q[0])! * Int(q[2])! == answer ? result.append("O") : result.append("X")
        case "/": Int(q[0])! / Int(q[2])! == answer ? result.append("O") : result.append("X")
        default:
            break
        }
    }
    
    return result
}

solution(["3 - 4 = -3", "5 + 6 = 11"])
