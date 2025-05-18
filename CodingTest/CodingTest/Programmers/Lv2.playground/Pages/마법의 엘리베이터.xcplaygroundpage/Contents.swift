import Foundation

func solution(_ storey:Int) -> Int {
    
    var count = 0
    var storey = storey
    
    while 0 < storey {
        let last = storey % 10
        let front = (storey % 100) / 10
        
        if last == 0 {
            storey /= 10
            continue
        }
        
        if front < 5 {
            if last <= 5 {
                storey -= last
                count += last
            } else {
                storey += (10 - last)
                count += (10 - last)
            }
        } else {
            if last < 5 {
                storey -= last
                count += last
            } else {
                storey += (10 - last)
                count += (10 - last)
            }
        }
        
            
        storey /= 10
    }
    
    return count
}
