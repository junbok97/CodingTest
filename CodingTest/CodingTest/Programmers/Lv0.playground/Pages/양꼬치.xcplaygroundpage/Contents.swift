import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    let sheep = 12000
    let drink = 2000
    let k = k - n / 10
    
   return  n * sheep + k * drink
}
