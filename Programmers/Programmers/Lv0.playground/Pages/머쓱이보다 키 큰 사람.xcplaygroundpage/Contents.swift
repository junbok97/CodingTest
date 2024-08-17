import Foundation

func solution(_ array:[Int], _ height:Int) -> Int {
    return array.filter { height < $0 }.count
}
