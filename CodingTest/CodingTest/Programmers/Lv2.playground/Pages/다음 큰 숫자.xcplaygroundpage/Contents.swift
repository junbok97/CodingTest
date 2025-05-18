import Foundation

func solution(_ n:Int) -> Int
{
    var n = n
    let count1 = String(n, radix: 2).filter { $0 == "1" }.count
    var count2 = 0

    while count1 != count2 {
        n += 1
        count2 = String(n, radix: 2).filter { $0 == "1" }.count
    }

    return n
}

func solution2(_ n:Int) -> Int {
    var answer : Int = n + 1

    while true {
        if n.nonzeroBitCount == answer.nonzeroBitCount {
            break;
        }
        answer += 1
    }

    return answer
}
