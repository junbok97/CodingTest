
func solution(_ triangle: [[Int]]) {
    let N = triangle.count
    
    var dp = Array(
        repeating: Array(repeating: 0, count: N),
        count: N
    )
    
    dp[0][0] = triangle[0][0]
    
    
    
    for i in 1..<N {
        for j in 0...i {
            var value = dp[i-1][j]
            if 0 < j {
                value = max(value, dp[i-1][j-1])
            }
            dp[i][j] = value + triangle[i][j]
        }
        
    }
    
    print(dp[N-1].max()!)
    
}


solution([[7], [3, 8], [8, 1, 0], [2, 7, 4, 4], [4, 5, 2, 6, 5]])
