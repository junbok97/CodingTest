func solution(_ n:Int) -> Int {
    
    var f0 = 0, f1 = 1, f2 = 0
    
    for _ in 2...n {
        f2 = (f0 + f1) % 1234567
        f0 = f1
        f1 = f2
    }
    
    return f2
}
