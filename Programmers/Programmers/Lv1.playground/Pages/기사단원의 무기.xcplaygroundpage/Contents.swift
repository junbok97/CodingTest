import Foundation

//func prime(_ number: Int) -> Int {
//    if number < 2 {
//        return number
//    }
//
//    var number = number
//    var result = [Int]()
//    var prime = 2
//    var count = 0
//
//    while number >= prime {
//        if number % prime == 0 {
//            number /= prime
//            count += 1
//            if number % prime != 0 {
//                result.append(count + 1)
//            }
//        } else {
//            prime += 1
//            count = 0
//        }
//    }
//
//    return result.reduce(1, *)
//}
//
//func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
//    return (1...number).map {
//        let count = prime($0)
//        return count > limit ? power : count
//    }.reduce(0, +)
//}

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    
    var attack = [Int](repeating: 0, count: number+1)

    for i in 1...number {
        var c = i
        while c <= number {
            attack[c] += 1
            c += i
        }
        print(attack)
    }
    attack = attack.map { $0 > limit ? power : $0 }
    return attack.reduce(0, +)
}

solution(10, 3, 2)


