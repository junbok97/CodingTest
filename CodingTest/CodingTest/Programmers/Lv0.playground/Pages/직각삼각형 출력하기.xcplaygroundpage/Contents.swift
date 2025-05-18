import Foundation

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }

(1...n.first!).forEach {
    print(String(repeating: "*", count: $0))
}

