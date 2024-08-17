import Foundation

func solution(_ i:Int, _ j:Int, _ k:Int) -> Int {
    (i...j).map {
        String($0).filter {
            Int(String($0)) == k
        }.count
    }.reduce(0, +)
}


solution(1,13,1)
