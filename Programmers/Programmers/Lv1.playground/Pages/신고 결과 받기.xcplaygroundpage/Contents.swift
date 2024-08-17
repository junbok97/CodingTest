//import Foundation
//
//func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
//
//
//    var user: [String : (reportID: Set<String>, report_count :Int)] = [:]
//    var reported: [String : Int] = [:]
//
//
//    id_list.forEach {user[$0] = (Set<String>() , 0)}
//    report.map { $0.components(separatedBy: " ") }.forEach {user[$0[0]]!.0.insert($0[1])}
//    user.forEach {$0.value.0.forEach {user[$0]!.1 += 1}}
//
//    user.forEach {
//
//        reported[$0.key] = $0.value.reportID.filter({ user[$0]!.report_count >= k }).count
//    }
//
//    return id_list.map {reported[$0]!}
//
//}


import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var reported: [String: Int] = [:]
    var user: [String: [String]] = [:]

   
    
    for r in Set(report) {
        let splited = r.split(separator: " ").map { String($0) }
        user[splited[0]] = (user[splited[0]] ?? []) + [splited[1]]
        reported[splited[1]] = (reported[splited[1]] ?? 0) + 1
    }

    return id_list.map { id in
        return (user[id] ?? []).reduce(0) {
            $0 + ((reported[$1] ?? 0) >= k ? 1 : 0)
        }
    }
}

solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2)


