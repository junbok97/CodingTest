import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    
    var result = [String : Int]()
    
    let records = records.map {
        $0.components(separatedBy: " ")
    }.forEach {
        let tmp = $0[0].components(separatedBy: ":")
        let time = Int(tmp[0])! * 60 + Int(tmp[1])!
        if result[$0[1]] == nil {result[$0[1]] = 0}
        if $0[2] == "IN" {result[$0[1]]! -= time} else {result[$0[1]]! += time}
    }
    
    result.forEach {
        if $0.value <= 0 {result[$0.key]! += 1439}
    }
    
    return result.sorted {
        $0.key < $1.key
    }.map {
        fees[1] + Int((ceil(Double($0.value - fees[0]) / Double(fees[2])))) * fees[3]
    }.map {
        $0 < fees[1] ? fees[1] : $0
    }
}

solution([1, 461, 1, 10], ["00:00 1234 IN"])

