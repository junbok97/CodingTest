import Foundation

//func solution(_ id_pw:[String], _ db:[[String]]) -> String {
//
//    let result = db.map {
//        $0[0] == id_pw[0] ? $0[1] == id_pw[1] ? "login" : "wrong pw" : "fail"
//    }
//
//    return result.contains("login") ? "login" : result.contains("wrong pw") ? "wrong pw" : "fail"
//
//}

//func solution(_ idPw: [String], _ db: [[String]]) -> String {
//    if let pw = Dictionary(uniqueKeysWithValues: db.map { ($0[0], $0[1]) })[idPw[0]] {
//        pw
//        return pw == idPw[1] ? "login" : "wrong pw"
//    } else {
//        return "fail"
//    }
//}

func solution(_ id_pw:[String], _ db:[[String]]) -> String {
    return db.contains(id_pw) ? "login"
    : db.map{$0[0]}.contains(id_pw[0]) ? "wrong pw"
    : "fail"
}


solution(["meosseugi", "1234"], [["rardss", "123"], ["yyoom", "1234"], ["meosseugi", "1234"]])
