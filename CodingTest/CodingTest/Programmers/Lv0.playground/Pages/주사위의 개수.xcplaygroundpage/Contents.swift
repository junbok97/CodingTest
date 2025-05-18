import Foundation

func solution(_ box:[Int], _ n:Int) -> Int {
    box.map { $0 / n }.reduce(1, *)
}
