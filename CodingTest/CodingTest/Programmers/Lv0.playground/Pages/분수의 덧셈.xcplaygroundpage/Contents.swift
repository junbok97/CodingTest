import Foundation

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    } else {
        return gcd (b, a % b)
    }
}

func solution(_ denum1:Int, _ num1:Int, _ denum2:Int, _ num2:Int) -> [Int] {
    
    let d = denum1 * num2 + denum2 * num1
    let n = num1 * num2
    let g = gcd(d, n)

    return [d/g, n/g]
}

solution(9, 2, 1, 3)
