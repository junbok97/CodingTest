import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    
    var term = [String: Int]()
    
    // tems의 기간 계산
    terms.forEach {
        let t = $0.components(separatedBy: " ")
        term[t[0]] = Int(t[1])!
    }
    
    return privacies.map {
        // 수집된 날짜와 타입 분할
        let t = $0.components(separatedBy: " ")
        
        // 날짜 나누기
        var result = t[0].components(separatedBy: ".").map {
            Int($0)!
        }
        
        // 유효날짜는 수집된날짜로부터 -1 만약하루를 뺏을때 0일이라면 달을 하나 줄이고 일수는 마지막날로
        result[2] -= 1
        if result[2] == 0 {
            result[1] -= 1
            result[2] = 28
        }
        
        // 수집된 달에다가 유효기간을 더해서 12월보다 크면 년수를 업
        result[1] += term[t[1]]!
        
        if result[1] > 12 {
            result[0] += result[1] / 12
            result[1] = result[1] % 12
            
            if result[1] == 0 {
                result[1] = 12
                result[0] -= 1
            }
        }
        
        return String(format: "%d.%02d.%02d", result[0], result[1], result[2])
    }.enumerated().filter {
        $0.element < today
    }.map {
        $0.offset + 1
    }
}

solution("2022.02.28",["A 23"],["2020.01.28 A"])

func solution2(_ today: String, _ terms: [String], _ privacies: [String]) -> [Int] {
    var answer = [Int]()
    var termDict = [String: Int]()
    let date = getDate(today)

    for s in terms {
        let term = s.components(separatedBy: " ")

        termDict[term[0]] = Int(term[1])
    }
    for i in privacies.indices {
        let privacy = privacies[i].components(separatedBy: " ")

        if getDate(privacy[0]) + (termDict[privacy[1]] ?? 0) * 28 <= date {
            answer.append(i + 1)
        }
    }
    return answer
}


private func getDate(_ today: String) -> Int {
    let date = today.split(separator: ".")
    let year = Int(date[0]) ?? 0
    let month = Int(date[1]) ?? 0
    let day = Int(date[2]) ?? 0
    return (year * 12 * 28) + (month * 28) + day
}
