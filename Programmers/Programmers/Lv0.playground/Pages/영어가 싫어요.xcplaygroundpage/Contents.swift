import Foundation

func solution(_ numbers:String) -> Int64 {
    let alphabet = ["zero":0, "one":1, "two":2, "three":3, "four":4, "five":5, "six":6, "seven":7, "eight":8, "nine":9]
    var result = ""
    var number = ""
    
    for n in numbers {
        number += String(n)
        if alphabet.keys.contains(number) {
            result += String(alphabet[number]!)
            number = ""
        }
    }
    return Int64(result)!
}
