import Foundation

func solution(_ num_list:[Int], _ n:Int) -> [[Int]] {
    
    var tmp = [Int]()
    var result = [[Int]]()
    var num_list = num_list

    var i = 0
    
    for num in num_list {
        if i == n {
            i = 0
            result.append(tmp)
            tmp.removeAll()
        }
        tmp.append(num)
        i += 1
    }
    
    result.append(tmp)
    return result
}

solution( [1, 2, 3, 4, 5, 6, 7, 8],2)
