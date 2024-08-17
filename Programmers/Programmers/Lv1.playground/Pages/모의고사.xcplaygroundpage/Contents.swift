import Foundation

func solution(_ answers:[Int]) -> [Int] {
    
    let student = (
        a : [1, 2, 3, 4, 5],
        b : [2, 1, 2, 3, 2, 4, 2, 5],
        c : [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    )
    
    var answer = [1:0, 2:0, 3:0]
    
    for (i, v) in answers.enumerated() {
        if v == student.a[i % student.a.count] { answer[1]! += 1 }
        if v == student.b[i % student.b.count] { answer[2]! += 1 }
        if v == student.c[i % student.c.count] { answer[3]! += 1 }
    }
    
    return answer.sorted{ $0.key < $1.key }.filter{ $0.value == answer.values.max()}.map{ $0.key }
    
}
