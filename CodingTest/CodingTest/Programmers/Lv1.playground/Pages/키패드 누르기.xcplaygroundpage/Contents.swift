import Foundation

func distance(_ hand: (Int, Int), _ keyPad: (Int, Int)) -> Int {
    return abs(hand.0 - keyPad.0) + abs(hand.1 - keyPad.1)
}

func solution(_ numbers:[Int], _ hand:String) -> String {

    let hand = hand == "right" ? "R" : "L"
    
    let keyPad = [
        1 : (0,0), 2 : (0,1), 3 : (0,2),
        4 : (1,0), 5 : (1,1), 6 : (1,2),
        7 : (2,0), 8 : (2,1), 9 : (2,2),
        11 : (3,0), 0 : (3,1), 12: (3,2)
    ]
    
    var answer = ""

    var rightHand = keyPad[11]!
    var leftHand = keyPad[12]!

    for number in numbers {
        switch number {
        case 1, 4, 7 :
            leftHand = keyPad[number]!
            answer += "L"
        case 3, 6, 9 :
            rightHand = keyPad[number]!
            answer += "R"
        default :
            
            let left_distance = distance(leftHand, keyPad[number]!)
            let right_distance = distance(rightHand, keyPad[number]!)
            
            if left_distance == right_distance {
                if hand == "R" {
                    rightHand = keyPad[number]!
                } else {
                    leftHand = keyPad[number]!
                }
                answer += hand
            }
            else if left_distance > right_distance {
                rightHand = keyPad[number]!
                answer = answer + "R"
            } else if left_distance < right_distance {
                leftHand = keyPad[number]!
                answer = answer + "L"
            }
        }
    }

    return answer
}
