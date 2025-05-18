import Foundation

func solution(_ dartResult:String) -> Int {

        let numberList = dartResult.split(whereSeparator: {$0.isLetter || $0 == "#" || $0 == "*"})
        let letterList = dartResult.split(whereSeparator: {$0.isNumber})

        var totalScore = 0

        for (i, (number, letter)) in zip(numberList, letterList).enumerated() {
            var score = 0
            if let number = Int(number) {
                score = letter.contains("D") ? number * number : letter.contains("T") ? number * number * number : number

            }

            if letter.contains("*") {
                score *= 2
            } else if letter.contains("#") {
                score = -score
            }

            if i != 2 {
                if letterList[i + 1].contains("*") {
                    score *= 2
                }
            }

            totalScore += score

        }


        return totalScore
}

solution("10S2D*3T")


//
//import Foundation
//
//struct Stack<T> {
//    private var stack: [T] = []
//
//    public var count: Int {
//        return stack.count
//    }
//
//    public var isEmpty: Bool {
//        return stack.isEmpty
//    }
//
//    public mutating func push(_ element: T) {
//        stack.append(element)
//    }
//
//    public mutating func pop() -> T? {
//        return isEmpty ? nil : stack.popLast()
//    }
//}
//
//
//func solution(_ dartResult:String) -> Int {
//
//    let bonus: [String : Double] = ["S" : 1.0, "D" : 2.0, "T" : 3.0]
//
//    var stack = Stack<Double>()
//    var result = 0.0
//    var num = ""
//
//    Array(dartResult).forEach {
//        let str = String($0)
//        switch str {
//        case "S", "D", "T":
//            var element = Double(num)!
//            element = pow(element, bonus[str]!)
//            stack.push(element)
//            num = ""
//        case "*" :
//            var first = stack.pop() ?? 0
//            var last = stack.pop() ?? 0
//            first *= 2
//            last *= 2
//            stack.push(last)
//            stack.push(first)
//        case "#":
//            guard let element = stack.pop() else {
//                return
//            }
//            stack.push(-element)
//        default :
//            num += str
//        }
//    }
//
//    while !stack.isEmpty {
//        result += stack.pop()!
//    }
//
//    return Int(result)
//}




//
//import Foundation
//
//struct Stack<T> {
//    private var stack: [T] = []
//
//    public var count: Int {
//        return stack.count
//    }
//
//    public var isEmpty: Bool {
//        return stack.isEmpty
//    }
//
//    public mutating func push(_ element: T) {
//        stack.append(element)
//    }
//
//    public mutating func pop() -> T? {
//        return isEmpty ? nil : stack.popLast()
//    }
//}
//
//
//func solution(_ dartResult:String) -> Int {
//
//    let bonus: [String : Double] = ["S" : 1.0, "D" : 2.0, "T" : 3.0]
//
//    var stack = Stack<Double>()
//    var result = 0.0
//
//    dartResult.components(separatedBy: ["S","D","T","*","#"]).compactMap { Double($0) }.forEach {
//        stack.push($0)
//    }
//
//    stack
//
//
//
//    let operation = Array(dartResult.components(separatedBy: ["0","1","2","3","4","5","6","7","8","9"]).filter { !$0.isEmpty }.joined())
//
//
//
//
//
//    Array(dartResult).forEach {
//        let str = String($0)
//
//        switch str {
//        case "S", "D", "T":
//            var element = stack.pop()!
//            element = pow(element, bonus[str]!)
//            stack.push(element)
//        case "*" :
//            var first = stack.pop() ?? 0
//            var last = stack.pop() ?? 0
//            first *= 2
//            last *= 2
//            stack.push(last)
//            stack.push(first)
//        case "#":
//            guard let element = stack.pop() else {
//                return
//            }
//            stack.push(-element)
//        default :
//            stack.push(Double(String($0))!)
//        }
////        print(stack)
//    }
//
//    while !stack.isEmpty {
//        result += stack.pop()!
//    }
//
//    return Int(result)
//}
//
//
//
//solution("1D2S#10S")


//func solution(_ dartResult:String) -> Int {
//
//    var dartResult = dartResult
//
//    let bonus: [String : Double] = ["S" : 1.0, "D" : 2.0, "T" : 3.0]
//    var score = dartResult.components(separatedBy: ["S","D","T","*","#"]).compactMap { Double($0) }
//    var result = dartResult.components(separatedBy: ["0","1","2","3","4","5","6","7","8","9"]).filter { !$0.isEmpty
//    }
//
//
//
////    score.map {
////        pow(Double($0.prefix($0.count - 1))!, bonus[String($0.last!)]!)
////    }
//
//
//    for i in 0..<3 {
//        score[i] = pow(score[i], bonus[String(result[i].first!)]!)
//
//    }
//
//
////    score = Array(dartResult.components(separatedBy: ["0","1","2","3","4","5","6","7","8","9","*","#"]).joined()).enumerated().map {
////        Int(pow(Double(score[$0.offset]), Double(bonus[String($0.element)]!)))
////    }
//
//
//
//
//
//    return 0
//}

//    dartResult.components(separatedBy: "*").map {
//        $0.components(separatedBy: "#").filter { !$0.isEmpty }.map {
//            pow(Double($0.prefix($0.count - 1))!, bonus[String($0.last!)]!)
//        }
//    }
    
//    dartResult.components(separatedBy: "*").map {
//        $0.components(separatedBy: "#")
//    }
//
//
//    dartResult.components(separatedBy: "*").filter { !$0.isEmpty }.map {
//        $0.components(separatedBy: "#").filter { !$0.isEmpty }.map {
//            pow(Double($0.prefix($0.count - 1))!, bonus[String($0.last!)]!)
//        }
//    }
//

//    dartResult.components(separatedBy: ["#","*"]).compactmap { pow(Double($0.prefix($0.count - 1))!, bonus[String($0.last!)]!) }
