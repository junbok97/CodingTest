import Foundation

func solution(_ chicken:Int) -> Int {
    
    var result = 0
    var coupon = chicken
    
    while coupon >= 10 {
        result += coupon / 10
        coupon = coupon / 10 + coupon % 10
    }
    
    return result
}

