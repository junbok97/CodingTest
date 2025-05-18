import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    
    let sum = brown + yellow
    
    var x = 0
    var y = 0
    
    for i in 1...sum {
        if sum % i == 0 {
            x = sum / i
            y = i
        }
        if (x - 2)*(y - 2) == yellow {
            break
        }
    }
    
    return [x, y]
}



solution(10, 2)



//func divisor(_ n:Int) -> [Int] {
//    return (2...n/2).filter { n % $0 == 0 }
//}
//
//func find_sqaure(_ n: Int) -> Int {
//    var x = 1
//
//    while x*x < n {
//        x += 1
//    }
//    return x
//}
//
//func solution2(_ brown:Int, _ yellow:Int) -> [Int] {
//
//    let total = brown + yellow
//    let x = find_sqaure(total)
//
//    var result = [Int]()
//
//    if total == x*x {
//        result = [x,x]
//    } else {
//        let div = divisor(total)
//        for i in 0..<div.count {
//            if x <= div[i] {
//                result = [max(div[i-1], div[i]),min(div[i-1], div[i])]
//                break
//            }
//        }
//    }
//    return result
//}
