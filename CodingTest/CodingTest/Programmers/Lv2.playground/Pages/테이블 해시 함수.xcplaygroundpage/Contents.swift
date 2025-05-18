import Foundation

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    var result = 0
    var data = data
        .sorted { $0[0] > $1[0] }
        .sorted { $0[col-1] < $1[col-1] }
    
    for i in row_begin...row_end {
        result ^= data[i-1].reduce(0, { $0 + ($1 % i) })
    }
    
    return result
}
