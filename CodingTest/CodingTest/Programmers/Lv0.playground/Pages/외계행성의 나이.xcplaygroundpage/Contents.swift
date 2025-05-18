import Foundation

func solution(_ age:Int) -> String {
    String(age).map { String(UnicodeScalar(97 + Int(String($0))!)!) }.joined()
}
