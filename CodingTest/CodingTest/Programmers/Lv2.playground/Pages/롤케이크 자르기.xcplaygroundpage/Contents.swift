import Foundation

func solution(_ 토핑모음:[Int]) -> Int {
    var 형의케이크토핑: [Int : Int] = [:]
    var 동생의케이크토핑: [Int : Int] = [:]
    var 자르는방법 = 0
    
    토핑모음.forEach { 토핑종류 in
        if 형의케이크토핑[토핑종류] != nil { 형의케이크토핑[토핑종류]! += 1 }
        else { 형의케이크토핑[토핑종류] = 1 }
    }
    
    for 토핑종류 in 토핑모음 {
        if 동생의케이크토핑[토핑종류] != nil { 동생의케이크토핑[토핑종류]! += 1 }
        else { 동생의케이크토핑[토핑종류] = 1 }
        if let 형의토핑개수 = 형의케이크토핑.removeValue(forKey: 토핑종류), 형의토핑개수 - 1 != 0 { 형의케이크토핑[토핑종류] = 형의토핑개수 - 1 }
        if 형의케이크토핑.count == 동생의케이크토핑.count { 자르는방법 += 1 }
        else if 형의케이크토핑.count < 동생의케이크토핑.count { break }
    }

    return 자르는방법
}
