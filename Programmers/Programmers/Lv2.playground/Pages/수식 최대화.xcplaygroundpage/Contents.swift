import Foundation

// 방법 1
func calculate(_ num: [Int64], _ expression: [String], _ priority: [String]) -> Int64 {
    var num = num
    var tmp:[Int64] = []
    var expression = expression
    
    for i in 0..<3 {
        for _ in 0..<expression.count {
            tmp.append(num.removeFirst())
            let exp = expression.removeFirst()
            if exp == priority[i] {
                switch exp {
                case "*":
                    num.insert(tmp.removeLast() * num.removeFirst(), at: 0)
                case "+":
                    num.insert(tmp.removeLast() + num.removeFirst(), at: 0)
                case "-":
                    num.insert(tmp.removeLast() - num.removeFirst(), at: 0)
                default:
                    break
                }
            } else { expression.append(exp) }
        }
        num = tmp + num
        tmp = []
    }
    
    return abs(num.removeFirst())
}

func solution(_ expression: String) -> Int64 {
    let alphabet = /[A-Za-z]{4}/
    expression.wholeMatch(of: alphabet)?.output
    
    var result: [Int64] = []
    let expressionPriority = [
        ["*", "+", "-"],
        ["*", "-", "+"],
        ["+", "*", "-"],
        ["+", "-", "*"],
        ["-", "*", "+"],
        ["-", "+", "*"]
    ]
    
    do {
        let numberRegex = try NSRegularExpression(pattern: "[0-9]*")
        let expressionRegex = try NSRegularExpression(pattern: "[*+-]")
        let numArray = numberRegex.matches(in: expression, range: NSRange(location: 0, length: expression.count)).compactMap {Int64(expression[Range($0.range, in: expression)!])}
        let expressionArray = expressionRegex.matches(in: expression, range: NSRange(location: 0, length: expression.count)).compactMap {String(expression[Range($0.range, in: expression)!])}
        for priority in expressionPriority {
            result.append(calculate(numArray, expressionArray, priority))
        }
    } catch {
        print("error")
    }
    return result.max()!
}


// 방법2
enum Operation: Character {
    case multiple = "*"
    case plus = "+"
    case minus = "-"

    func operate(_ n1: Int64, _ n2: Int64) -> Int64 {
        switch self {
            case .multiple: return n1 * n2
            case .plus: return n1 + n2
            case .minus: return n1 - n2
        }
    }
}

func operate(numbers: [Int64], opers: [Character], prior: [Operation]) -> Int64 {
    var numbers = numbers
    var opers = opers
    for oper in prior {
        while let index = opers.firstIndex(of: oper.rawValue) {
            numbers[index] = oper.operate(numbers[index], numbers[index+1])
            numbers.remove(at: index+1)
            opers.remove(at: index)
        }
    }
    return abs(numbers[0])
}

func solution2(_ expression:String) -> Int64 {
    let numbers = expression.components(separatedBy: ["*", "+", "-"]).map{abs(Int64($0)!)}
    let opers = Array(expression.filter({ Int(String($0)) == nil}))
    let myOper = "*+-"
    var maxValue: Int64 = 0

    for first in myOper {
        for second in myOper {
            guard first != second else { continue }
            let third = "*+-".filter({$0 != first && $0 != second})[0]
            let result = operate(numbers: numbers, opers: opers, prior: [
                Operation(rawValue: first)!,
                Operation(rawValue: second)!,
                Operation(rawValue: third)!
            ])
            maxValue = max(maxValue, result)
        }
    }
    return maxValue
}
