import Foundation

func solution(_ k:Int, _ ranges:[[Int]]) -> [Double] {
    
    let collatz: (Double) -> Double = { num in
        if Int(num) % 2 == 0 {
            return num / 2
        } else {
            return (num * 3) + 1
        }
    }
    
    var collatzList: [Double] = [Double(k)]
    var areaList: [Double] = []
    var resultList: [Double] = []
    
    while 1 < collatzList.last! {
        var num = collatzList.last!
        var collatzNum = collatz(num)
        
        collatzList.append(collatzNum)
        areaList.append((num+collatzNum)/2)
    }
    
    for range in ranges {
        let (a, b) = (range[0], range[1])
        
        if  a == areaList.count + b  { // 가로가 0
            resultList.append(0)
        } else if a > areaList.count + b { // 범위를 벗어나서 -1
            resultList.append(-1)
        } else {
            resultList.append(
                areaList[a..<areaList.count+b].reduce(0, +)
            )
        }
    }
    
    return resultList
}
