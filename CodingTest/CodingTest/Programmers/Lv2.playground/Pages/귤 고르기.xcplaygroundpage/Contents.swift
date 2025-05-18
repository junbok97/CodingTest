import Foundation

func solution(_ k: Int, _ tangerine: [Int]) -> Int {
    return Dictionary(grouping: tangerine) { $0 }.values
        .sorted { $0.count > $1.count }
        .reduce((0, 0)) { acc, array in acc.1 >= k ? acc : (acc.0 + 1, acc.1 + array.count) }
        .0
}

solution(4, [1, 3, 2, 5, 4, 5, 2, 3])

//func solution(_ k:Int, _ tangerine:[Int]) -> Int {
//
//    var k = k
//    var count = 0
//    var dict: [Int : Int] = [:]
//    var result: [(key :Int, value :Int)] = []
//
//    Set(tangerine).forEach { dict[$0] = 0 }
//    tangerine.forEach { dict[$0]! += 1 }
//    dict.forEach { result.append(($0.key, $0.value)) }
//    result = result.sorted { $0.value > $1.value }
//
//    while 0 < k {
//        let max = result.removeFirst()
//        k -= max.value
//        count += 1
//    }
//
//    return count
//}



//func solution(_ k:Int, _ tangerine:[Int]) -> Int {
//
//    var k = k
//    var count = 0
//
//    var result = Set(tangerine).reduce(into: [:]) { dict, element in
//        dict[element] = tangerine.filter({ $0 == element }).count
//    }
//
//    while 0 < k {
//        let max = result.max {$0.value < $1.value}!
//        result.removeValue(forKey: max.key)
//        k -= max.value
//        count += 1
//    }
//
//    return count
//}


