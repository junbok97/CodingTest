import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    
    var answer: Int64 = 0
    var d = 0
    var p = 0
    
    for i in stride(from: n - 1, to: -1, by: -1) {
        
        var cnt = 0
        
        d -= deliveries[i]
        p -= pickups[i]
        
        while d < 0 || p < 0 {
            d += cap
            p += cap
            cnt += 1
        }
        
        answer += Int64((i + 1) * 2 * cnt)
    }

    return answer
}
