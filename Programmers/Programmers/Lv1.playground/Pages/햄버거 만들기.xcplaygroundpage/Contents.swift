import Foundation

func solution(_ ingredient:[Int]) -> Int {
    
    var stacks: [Int] = []
    var count: Int = 0
    for ingredient in ingredient {
        stacks.append(ingredient)
        let suffix = stacks.suffix(4)
        if suffix == [1,2,3,1] {
            count += 1
            stacks.removeLast(4)
        }
    }
    return count
}

//func solution(_ ingredient:[Int]) -> Int {
//
//    var str = ""
//    var answer = 0
//
//    for i in ingredient {
//        str += "\(i)"
//        if str.count >= 4 && str.contains("1231") {
//            answer += 1
//            str = str.replacingOccurrences(of: "1231", with: "")
//        }
//    }
//
//    return answer
//}

//func solution(_ ingredient:[Int]) -> Int {
//
//    var tmp = [Int]()
//    var answer = 0
//
//    for i in ingredient {
//        tmp.append(i)
//        let count = tmp.count
//        if count >= 4 {
//            if tmp[count-1] == 1 && tmp[count-2] == 3 && tmp[count-3] == 2 && tmp[count-4] == 1 {
//                tmp.popLast()
//                tmp.popLast()
//                tmp.popLast()
//                tmp.popLast()
//                answer += 1
//            }
//        }
//    }
//
//    return answer
//}


//func solution3(_ ingredient:[Int]) -> Int {
//    var str = ""
//    var count = 0
//
//    ingredient.forEach {
//        str += "\($0)"
//        if str.contains("1231") {
//            count += 1
//            str = str.replacingOccurrences(of: "1231", with: "")
//        }
//    }
//
//    return count
//}
//
//func solution2(_ ingredient:[Int]) -> Int {
//
//    var count = 0
//    var str = ingredient.map {String($0)}.joined()
//
//    while str.contains("1231") {
//        str = str.replacingOccurrences(of: "1231", with: "x")
//        count += str.filter {String($0) == "x"}.count
//        str = str.replacingOccurrences(of: "x", with: "")
//    }
//
//    return count
//}

solution([2, 1, 1, 2, 3, 1, 2, 3, 1])



