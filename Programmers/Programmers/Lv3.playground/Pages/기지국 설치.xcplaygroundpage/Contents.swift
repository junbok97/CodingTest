import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var answer = 0
    var start = 1
    
    // 1...lastStation
    for station in stations {
        // staion의 직전까지 필요한 중계기 수 = (전파가 닿지 않는 아파트의 개수 / 전파의 범위) 올림
        answer += Int(ceil((Double(station - w - start) / Double(2 * w + 1))))
        start = station + w + 1
    }
    // lastStation...lastApartment
    if start <= n {
        // 남은 아파트 계산
        answer += Int(ceil((Double(n - start + 1) / Double(2 * w + 1))))
    }

    return answer
}

func solution2(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var answer = 0
    var index = 0
    var i = 1
    
    while i <= n {
        if (index < stations.count && ((stations[index] - w) <= i)) {
            i = stations[index] + w + 1
            index += 1
        }
        else {
            answer += 1
            i += w * 2 + 1
        }
    }
    
    return answer
}
