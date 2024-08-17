import Foundation

func gcd(_ a: Int, _ b: Int) -> Int{
    var tmp: Int, n: Int, a = a, b = b
    
    if(a < b){
        tmp = a
        a = b
        b = tmp
    }
    
    while(b != 0){
        n = a % b
        a = b
        b = n
    }
    
    return a
}

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    
    var gcdA = arrayA.first!
    var gcdB = arrayB.first!

    zip(arrayA, arrayB).forEach { a,b in
        gcdA = gcd(gcdA, a)
        gcdB = gcd(gcdB, b)
    }

    for num in arrayA {
        if num % gcdB == 0 {
            gcdB = 0
            break
        }
    }
    
    for num in arrayB {
        if num % gcdA == 0 {
            gcdA = 0
            break
        }
    }
    
    return max(gcdA, gcdB)
}



solution([14, 35, 119],[18, 30, 102])
