import Foundation

func solution(_ array:[Int], _ n:Int) -> Int {
    array.sorted { abs($0 - n) < abs($1 - n) }.first!
}
