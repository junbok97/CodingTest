import Foundation

func solution(_ num:Int, _ k:Int) -> Int {
    return Array("_\(num)").firstIndex(of: Character("\(k)")) ?? -1
}
