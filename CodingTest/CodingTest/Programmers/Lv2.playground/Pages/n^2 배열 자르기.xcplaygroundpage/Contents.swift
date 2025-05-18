import Foundation

func solution(_ n: Int, _ left: Int64, _ right: Int64) -> [Int] {
    return (left...right).map { max(Int($0) / n, Int($0) % n) + 1 }
}


//func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
//
//    var arr = [Int]()
//    let left = Int(left)
//    let right = Int(right)
//
//    for i in left/n...right/n {
//        for j in 0..<n {
//            arr.append(max(i, j) + 1)
//        }
//    }
//
//    let range = left % n
//
//    return Array<Int>(arr[range...range+(right-left)])
//}


