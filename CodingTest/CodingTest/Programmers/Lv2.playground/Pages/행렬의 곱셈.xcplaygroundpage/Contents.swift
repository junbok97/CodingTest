import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    
    var answer = Array(repeating: [Int](), count: arr1.count)
    
    for i in 0..<arr1.count {
        for j in 0..<arr2[0].count{
            var value = 0
            for k in 0..<arr2.count{
                value += arr1[i][k] * arr2[k][j]
            }
            answer[i].append(value)
        }
    }
    return answer
}


//func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
//
//    var new_arr2 = [[Int]]()
//
//    let row = arr2.count
//    let col = arr2[0].count
//
//    for i in 0..<row {
//        var tmp = [Int]()
//        for j in 0..<col {
//            tmp.append(arr2[j][i])
//        }
//        new_arr2.append(tmp)
//    }
//
//    return arr1.map { a1 in
//        new_arr2.map { a2 in
//            zip(a1, a2).map {
//                $0 * $1
//            }.reduce(0, +)
//        }
//    }
//}

solution([[2, 3, 2], [4, 2, 4], [3, 1, 4]], [[5, 4, 3], [2, 4, 1], [3, 1, 1]])
