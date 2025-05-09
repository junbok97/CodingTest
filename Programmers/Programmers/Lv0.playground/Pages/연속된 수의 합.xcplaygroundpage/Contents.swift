import Foundation

func solution(_ num:Int, _ total:Int) -> [Int] {
    let startNum = total/num - num/2 + (num % 2 == 0 ? 1 : 0)
    return (0..<num).map{ $0 + startNum }
}

solution(5,5)
