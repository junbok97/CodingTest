import Foundation

func solution(_ p:String) -> String {
    // 입력이 빈 문자열인 경우, 빈 문자열 반환
    if p.count < 1 {return ""}

    var count = 0, index = p.startIndex
    
    // repeat while문으로 균형잡힌 괄호 문자열인지 확인
    // ( 이면 count + 1, ) 이면 count - 1
    // count가 0이 될 때까지 진행
    repeat{
        count += String(p[index]) == "(" ? 1 : -1
        index = p.index(after: index)
    } while count != 0

    // 위의 과정에서 알아낸 index 값을 토대로 u, v 문자열 나누기
    var u = String(p[..<index]), v = String(p[index...])
    
    // 올바른 괄호 문자열인지 확인
    if String(u.first!) == "("{
        return u + solution(v)
    }else{
        u.removeLast()
        u.removeFirst()
        return "(\(solution(v)))\(u.map{String($0) == "(" ? ")" : "("}.joined())"
    }
}
