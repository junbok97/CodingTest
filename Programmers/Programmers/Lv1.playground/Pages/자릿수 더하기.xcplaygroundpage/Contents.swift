import Foundation

func solution(_ n:Int) -> Int
{
    return "\(n)".compactMap { $0.hexDigitValue }.reduce(0, +)
//    return String(n).reduce(0, {$0+Int(String($1))!});
    
}
