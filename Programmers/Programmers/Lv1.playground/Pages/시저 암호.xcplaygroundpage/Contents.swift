import Foundation

func solution(_ s:String, _ n:Int) -> String {
    return s.utf8.map {
        var asciiCode = Int($0)
        switch asciiCode {
            case 65...90:
                asciiCode = (asciiCode + n - 65) % 26 + 65
            case 97...122:
                asciiCode = (asciiCode + n - 97) % 26 + 97
            default:
                break
        }
        return String(UnicodeScalar(asciiCode)!)
    }.joined()
}
