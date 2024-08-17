import Foundation

//func solution(_ numlist:[Int], _ n:Int) -> [Int] {
//    return numlist.sorted(by: >).map { $0 - n }.sorted { abs($0) < abs($1) }.map { $0 + n }
//}

func solution(_ numlist:[Int], _ n:Int) -> [Int] {
    return numlist.sorted(by: { (abs($0 - n), -$0) < (abs($1 - n), -$1) })
}


solution([10000,20,36,47,40,6,10,7000], 30)
