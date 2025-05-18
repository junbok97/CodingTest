func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    return (0..<n).map { String(arr1[$0] | arr2[$0] | 2<<(n-1), radix: 2).map { $0 == "1" ? "#" : " " }[1...n].joined() }
    
//    return (0..<n).map { String(String(arr1[$0]|arr2[$0]|2<<(n - 1), radix: 2).map { $0 == "1" ? "#" : " " }[1...n]) }
}


func solution2(_ n:Int, _ arr1:[Int], _ arr2: [Int]) -> [String] {
    
    let secretMap1 =  arr1.map {String($0, radix: 2)}.map {
        $0.count == n ? $0 : "\(String(repeating: "0", count: n-$0.count))\($0)"
    }.map { Array($0).map { Int(String($0)) } }
    
    let secretMap2 = arr2.map {String($0, radix: 2)}.map {
        $0.count == n ? $0 : "\(String(repeating: "0", count: n-$0.count))\($0)"
    }.map { Array($0).map { Int(String($0)) } }
        
    let answer = zip(secretMap1, secretMap2).map { zip($0, $1).map { $0 == 1 || $1 == 1 ? 1 : 0 } }
    
    return answer.map { $0.map { $0 == 1 ? "#" : " " }.joined() }
}


