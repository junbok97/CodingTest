import Foundation

func solution(_ record:[String]) -> [String] {
    var result: [String] = []
    var nickName: [String : String] = [:]
    
    let record = record.map { $0.components(separatedBy: " ") }
    
    record.forEach { if $0[0] == "Enter" || $0[0] == "Change" { nickName[$0[1]] = $0[2] } }
    
    record.forEach {
        if $0[0] == "Enter" { result.append("\(nickName[$0[1]]!)님이 들어왔습니다.") }
        if $0[0] == "Leave" { result.append("\(nickName[$0[1]]!)님이 나갔습니다.") }
    }
    
    return result
}
