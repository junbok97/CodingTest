import Foundation

func solution(_ cards:[Int]) -> Int {
    
    var index: Int = 0
    var tmp: [Int] = [index]
    var result: [Int] = []
    var visited: [Bool] = Array(repeating: false, count: cards.count)
    visited[index] = true
    
    while visited.contains(false) {
        index = cards[index] - 1
        if visited[index] {
            index = visited.firstIndex(of: false)!
            result.append(tmp.count)
            tmp = [index]
            visited[index] = true
        } else {
            visited[index] = true
            tmp.append(index)
        }
    }
    
    result.append(tmp.count)
    result = result.sorted(by: >)
    
    return result.count < 2 ? 0 : result[0] * result[1]
}

func solution2(_ cards:[Int]) -> Int {
    
    var answerArr = [Int]()
    var visited = [Bool](repeating: false, count: cards.count)

    for i in 0..<cards.count {
        if visited[i] { continue }

        var a = i
        var cnt = 0
        while true {
            if visited[a] { break }
            visited[a] = true
            a = cards[a]-1
            cnt += 1
        }
        answerArr.append(cnt)
    }

    answerArr.sort(by: <)
    return answerArr.count < 2 ? 0 : answerArr[answerArr.count-1]*answerArr[answerArr.count-2]
}

//solution( [ 2, 3, 4, 5, 6, 7, 8, 9, 10 , 1 ])
//solution([8,6,3,7,2,5,1,4])
//solution([5, 3, 2, 1, 4])
