import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    
    let type = [["R", "T"], ["C", "F"], ["J", "M"], ["A", "N"]]
    let score = [3,2,1,0,1,2,3]
    
    var mbti: [String: Int] = ["R" : 0, "T" : 0, "C" : 0, "F" : 0, "J" : 0, "M" : 0, "A" : 0, "N" : 0]

    zip(survey, choices).forEach {
        let first = String($0.first!)
        let last = String($0.last!)
        if $1 < 4 {
            mbti[first]! += score[$1 - 1]
        } else {
            mbti[last]! += score[$1 - 1]
        }
    }
     
    return type.map {mbti[$0[0]]! >= mbti[$0[1]]! ? $0[0] : $0[1]}.joined()
     
}



//for i in 0..<survey.count {
//    let str = Array(survey[i])
//    let choice = choices[i] - 1
//    if choice < 4 {
//        mbti[String(str[0])]! += score[choice]
//    } else {
//        mbti[String(str[1])]! += score[choice]
//    }
//}

