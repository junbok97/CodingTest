import Foundation

func solution(_ n:Int) -> Int {
    n == 0 ? 0 : (1...n).filter{
        n % $0 == 0
    }.reduce(0, +)
}
