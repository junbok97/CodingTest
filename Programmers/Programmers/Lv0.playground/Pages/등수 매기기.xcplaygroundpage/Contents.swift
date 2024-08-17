//import Foundation
//
//func solution(_ score:[[Int]]) -> [Int] {
//
//    var rank = 1
//    let sortScore = score.enumerated().map { (i,v) in
//        (average: v.reduce(0,+) ,index: i)
//    }.sorted { $0.average > $1.average }
//
//
//    var average = sortScore[0].average
//    var result = [(index: Int,rank: Int)]()
//
//    for (index, score) in sortScore.enumerated() {
//        if average == score.average {
//            result.append((score.index,rank))
//        } else {
//            result.append((score.index,index + 1))
//            average = score.average
//            rank = index + 1
//        }
//    }
//
//    return result.sorted { $0.index < $1.index }.map { $0.rank }
//
//}

func solution(_ score:[[Int]]) -> [Int] {
    score.map { $0.reduce(0,+) }.map {
        score.map {
            $0.reduce(0, +)
        }.sorted(by: >).firstIndex(of: $0)! + 1 }
}

solution([[80, 70], [70, 80], [30, 50], [90, 100], [100, 90], [100, 100], [10, 30]])
