import Foundation

func solution(_ price:Int) -> Int {
    let price = Double(price)
    switch price {
    case 100000..<300000 :
        return Int(price * 0.95)
    case 300000..<500000 :
        return Int(price * 0.9)
    case 500000... :
        return Int(price * 0.8)
    default :
        return Int(price)
    }
}

solution(200000)
