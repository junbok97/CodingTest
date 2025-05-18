import Foundation

struct UserInfo: Comparable {
    let age: Int
    let name: String
}




func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
    var left = left
    var right = right
    var result: [T] = []
    
    while !left.isEmpty && !right.isEmpty {
        if left.first! < right.first! {
            result.append(left.removeFirst())
        } else {
            result.append(right.removeFirst())
        }
    }
    
    result.append(contentsOf: left)
    result.append(contentsOf: right)
    return result
}


func mergeSort<T: Comparable>(_ arr: [T]) -> [T] {
    if arr.count <= 1 { return arr }
    let mid = arr.count/2
    let left = mergeSort(Array(arr[0..<mid]))
    let right = mergeSort(Array(arr[mid..<arr.count]))
    return merge(left, right)
}


func solution() {
    
    let N = Int(readLine()!)!
    
    var arr: [UserInfo] = []
    
    for _ in 1...N {
        let input = readLine()!.components(separatedBy: " ")
        arr.append(
            .init(
                age: Int(input[0])!,
                name: input[1]
            )
        )
    }
    
    mergeSort(arr)
    
}


solution()
