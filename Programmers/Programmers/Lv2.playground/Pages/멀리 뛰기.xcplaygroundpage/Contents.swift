func solution(_ n:Int) -> Int {
    
    if n < 3 {
        return n
    }
    
    var f0 = 1
    var f1 = 2
    var f2 = 0
    
    for _ in 3...n {
        f2 = (f0 + f1) % 1234567
        f0 = f1
        f1 = f2
        
    }
    
    return f2
}
