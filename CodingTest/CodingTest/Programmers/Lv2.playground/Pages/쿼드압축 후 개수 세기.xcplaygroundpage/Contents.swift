import Foundation

func solution(_ arr:[[Int]]) -> [Int] {
    var zeroCount = 0
    var oneCount = 0

    func quadCompression(_ row: Int, _ col: Int, _ n: Int) {
        let target = arr[row][col]
        
        for i in row..<row+n {
            for j in col..<col+n {
                if target != arr[i][j] {
                    quadCompression(row, col, n/2)
                    quadCompression(row, col + n/2, n/2)
                    quadCompression(row + n/2, col, n/2)
                    quadCompression(row + n/2, col + n/2, n/2)
                    return
                }
            }
        }
        
        if target == 0 { zeroCount += 1}
        else  { oneCount += 1 }
    }
    
    quadCompression(0, 0, arr.count)
    
    return [zeroCount, oneCount]
}
