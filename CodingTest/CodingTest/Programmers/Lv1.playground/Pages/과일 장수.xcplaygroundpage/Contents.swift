import Foundation


func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    var answer = 0
    var score = score.sorted{$0 > $1}
    var start = m-1
    while start < score.count {
        answer += m*score[start]
        start += m
    }

    return answer
}

//func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
//
//    var box = [Int]()
//    var result = 0
//    let score = score.sorted(by: >).forEach {
//        box.insert($0, at: 0)
//        if box.count >= m {
//            result += box.first! * m
//            box.removeAll()
//        }
//    }
//
//    return result
//}



solution(3,4,[1,2,3,1,2,3,1])
