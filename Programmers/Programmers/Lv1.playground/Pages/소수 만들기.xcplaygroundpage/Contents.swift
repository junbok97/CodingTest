import Foundation

func isPrime(num :Int) -> Bool {
    
    if num < 0 {
        return false
    }
    if num < 2 {
        return true
    }
        
    for i in 2...(num/2) {
        if num%i == 0 {
            return false
        }
    }
    return true
}

func solution(_ nums:[Int]) -> Int {
    var result = 0

    let num = nums.sorted()
    
    for i in stride(from: 0, through: num.count-3, by: 1){
        for j in stride(from: i+1, through: num.count-2, by: 1){
            for k in stride(from: j+1, through: num.count-1, by: 1){
                let prime = num[i] + num[j] + num[k]
                if isPrime(num: prime) {
                    print("[\(num[i]),\(num[j]),\(num[k])]를 이용해서 \(prime)을 만들 수 있습니다.")
                    result += 1
                }
            }
        }
    }

    return result
}
