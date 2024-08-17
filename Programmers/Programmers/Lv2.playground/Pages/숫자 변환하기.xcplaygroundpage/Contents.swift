import Foundation

func solution(_ x: Int, _ y: Int, _ n: Int) -> Int {
    var arr = Array(repeating: Int.max, count: y + 1)
    arr[x] = 0

    for i in x...y where arr[i] != Int.max {
        var num = i
        if num + n <= y {
            arr[num + n] = min(arr[num] + 1, arr[num + n])
        }
        if num * 2 <= y {
            arr[num * 2] = min(arr[num] + 1, arr[num * 2])
        }
        if num * 3 <= y {
            arr[num * 3] = min(arr[num] + 1, arr[num * 3])
        }
    }
    return arr[y] == Int.max ? -1 : arr[y]
}
