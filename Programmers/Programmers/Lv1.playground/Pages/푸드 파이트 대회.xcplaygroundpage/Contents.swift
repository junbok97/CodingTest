
import Foundation

func solution(_ food:[Int]) -> String {
    
    let myString = food.enumerated().map {
        String(repeating: String($0.offset), count: ($0.element % 2 == 0 ? $0.element : $0.element - 1) / 2)
    }.joined()
    myString
    return "\(myString)0\(String(myString.reversed()))"
}

solution([1,7,1,2])

//func solution(_ food:[Int]) -> String {
//
//    var result = [0]
//
//    let foods = food.enumerated().filter { $0.element > 1}.map {
//        (index: $0.offset, number: $0.element/2)
//    }.reversed()
//
//    for food in foods {
//        for i in 1...food.number {
//            result.append(food.index)
//            result.insert(food.index, at: 0)
//        }
//    }
//
//    return result.map { String($0) }.joined()
//}
