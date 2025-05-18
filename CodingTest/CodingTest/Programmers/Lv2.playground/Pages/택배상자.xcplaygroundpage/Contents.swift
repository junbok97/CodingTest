import Foundation

func solution(_ order:[Int]) -> Int {
    var stack = [Int]()
    var number = 1
    var answer = 0

    for i in 0..<order.count {
        while number <= order[i] {
            stack.append(number)
            number += 1
        }
        if stack.last! == order[i] {
            _ = stack.popLast()
            answer += 1
        } else {
            break
        }
    }

    return answer
}

func solution2(_ order:[Int]) -> Int {
    var index = 0
    var mainBeltBox = 1
    var secondBelt: [Int] = []

    while index < order.count {
        // 메인벨트에 있는 상자보다 order[index]의 상자가 크면 세컨벨트로 옮긴다
        if mainBeltBox < order[index] {
            secondBelt.append(mainBeltBox)
            mainBeltBox += 1
        // 메인벨트에 있는 상자와 order[index]의 상자와 같다면 메인벨트에서 상자를 꺼내고 다음 order로 넘어간다
        } else if mainBeltBox == order[index] {
            index += 1
            mainBeltBox += 1
        // 세컨벨트에 상자가 있을 때
        } else if 0 < secondBelt.count {
            if order[index] == secondBelt.popLast()! { index += 1 }
            else { break }
        } else { break }
    }
    
    return index
}

solution([4, 3, 1, 2, 5])


