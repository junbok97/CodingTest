import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    
    var result = 0
    var a = a.sorted(by: <)
    var b = b.sorted(by: <)
    
    while !a.isEmpty && !b.isEmpty && a.first! < b.last! {
        if a.first! < b.removeFirst() {
            a.removeFirst()
            result += 1
        }
    }
    
    return result
}

func solution2(_ a:[Int], _ b:[Int]) -> Int {

    var index = 0
    let a = a.sorted()
    let b = b.sorted()

    for element in b {
        if a[index] < element {
            index += 1
        }
    }

    return index
}
