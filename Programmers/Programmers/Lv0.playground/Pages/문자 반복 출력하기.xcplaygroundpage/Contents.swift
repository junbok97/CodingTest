import Foundation

func solution(_ my_string:String, _ n:Int) -> String {
    return my_string.map { (element: Character) -> String in
        var str = ""
        for _ in (1...n) {
            str += String(element)
        }
        return str
    }.reduce("", +)
}
