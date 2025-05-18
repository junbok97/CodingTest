import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    return (left...right).map{ number in
        (1...number).filter {
            number % $0 == 0
        }.count % 2 == 0 ? number : -number
    }.reduce(0, +)
}

