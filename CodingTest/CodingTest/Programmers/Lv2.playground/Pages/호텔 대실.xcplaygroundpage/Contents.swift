import Foundation

enum 방 {
    case 입실
    case 퇴실
}

struct 예약정보 {
    let 시간: Double
    let 상태: 방
}

func solution(_ book_time:[[String]]) -> Int {
    
    var 예약리스트: [예약정보] = []
    
    book_time.forEach { time in
        var array = time.compactMap {Int($0.components(separatedBy: ":").joined())}
        array[1] += 10
        if 60 <= array[1] % 100 {
            array[1] += 40
        }
        
        예약리스트.append(예약정보(시간: Double(array[0]), 상태: .입실))
        예약리스트.append(예약정보(시간: Double(array[1]) - 0.1, 상태: .퇴실))
    }
    
    예약리스트 = 예약리스트.sorted { $0.시간 < $1.시간 }
    
    var 최대방갯수 = 0
    var 현재방갯수 = 0
    
    for 예약 in 예약리스트 {
        switch 예약.상태 {
        case .입실:
            현재방갯수 += 1
        case .퇴실:
            현재방갯수 -= 1
        }
        최대방갯수 = max(최대방갯수, 현재방갯수)
    }
    
    return 최대방갯수
}
