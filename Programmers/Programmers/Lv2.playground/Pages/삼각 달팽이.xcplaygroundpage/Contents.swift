import Foundation

func solution(_ n:Int) -> [Int] {
    var n = n
    var arr: [[Int]] = [[Int]](repeating: Array(repeating: 0,count: n), count: n)
    
    var row = -1
    var col = 0
    var count = 0
    var value = 1
    
    while 0 < n {
        count = 0
        // 행에 따라 값을 변경
        while (count < n) {
            row += 1
            arr[row][col] = value
            value += 1
            count += 1
        }
        
        count = 0
        while (count < n-1) {
            // 마지막행의 첫열의 값은 위에서 채웠기 때문에 다음열부터 값을 저장
            col += 1
            arr[row][col] = value
            value += 1
            count += 1
        }
        
        count = 0
        while (count < n-2) {
            col -= 1
            row -= 1
            // 마지막행의 마지막열에의 값은 위에서 채웠기 때문에 그위의 값부터 채움
            arr[row][col] = value
            value += 1
            count += 1
        }
        
        n -= 3
    }
    
    return arr.flatMap { $0.filter{ $0 != 0 } }
}
