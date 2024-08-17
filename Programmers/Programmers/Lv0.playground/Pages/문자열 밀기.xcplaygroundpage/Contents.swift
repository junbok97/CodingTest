//import Foundation

//func solution(_ A:String, _ B:String) -> Int {
//
//    var A = A
//
//    for i in 1...A.count {
//        A = "\(A.removeLast())\(A)"
//        if A == B { return i }
//    }
//
//    return -1
//}

import Foundation

func solution(_ A:String, _ B:String) -> Int {
    let arr = (A+A).components(separatedBy: B)
    return arr.count == 1 ? -1 : arr[1].count
}


