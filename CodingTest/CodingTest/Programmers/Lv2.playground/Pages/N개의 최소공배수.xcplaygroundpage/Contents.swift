//func solution(_ arr:[Int]) -> Int {
//
//    var divisor = Set<Int>()
//
//    for i in arr {
//        var set = Set<Int>()
//
//        if 0 < i && i < 3 {
//            divisor.insert(i)
//            continue
//        }
//
//        for j in 2..<i {
//            if i % j == 0{
//                set.insert(j)
//            }
//        }
//
//        if set.isEmpty {
//            divisor.insert(i)
//        } else {
//            divisor = divisor.union(set)
//        }
//    }
//
//    divisor
//
//    return divisor.reduce(1, *)
//}


//func primefactor(_ num:Int) -> [Int : Int] {
//    var prime = [Int : Int]()
//
//    var num = num
//
//    for i in stride(from: 2, through: num, by: 1) {
//        while num % i == 0 {
//            if prime[i] == nil {
//                prime[i] = 1
//            } else {
//                prime[i]! += 1
//            }
//            num = num / i
//        }
//    }
//
//    return prime
//}
//
//func solution(_ arr:[Int]) -> Int {
//
//    var answer = [Int : Int] ()
//
//    for num in arr {
//        let prime = primefactor(num)
//        for (key, value) in prime {
//            if answer[key] == nil {
//                answer[key] = value
//            } else {
//                if answer[key]! < value {
//                    answer[key] = value
//                }
//            }
//        }
//    }
//
//    return Int(answer.map { (key: Int, value: Int) in
//        pow(Double(key), Double(value))
//    }.reduce(1, *))
//
//}


func gcd(_ a: Int, _ b: Int) -> Int {
  let r = a % b
  if r != 0 {
    return gcd(b, r)
  } else {
    return b
  }
}

func lcm(_ m: Int, _ n: Int) -> Int {
    print("m = \(m) n = \(n)")
  return m / gcd(m, n) * n
}

func solution(_ arr:[Int]) -> Int {
    return arr.reduce(1) { lcm($0, $1) }
}

solution([2,6,8,14])
