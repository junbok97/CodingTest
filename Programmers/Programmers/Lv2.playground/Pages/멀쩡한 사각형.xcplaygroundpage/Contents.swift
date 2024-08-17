import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    var answer:Int64 = 0

    // y = ax
    for x in 1..<w {
        answer += Int64((h * x) / w)
    }
    
    return answer * 2
}
