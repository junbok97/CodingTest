import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    let answer:Int64 = Int64((1...count).map { $0 * price }.reduce(money, -))
    return answer < 0 ? -answer : 0
}

func solution2(_ price:Int, _ money:Int, _ count:Int) -> Int{
    return max((count + 1) * count / 2 * price - money , 0)
}
