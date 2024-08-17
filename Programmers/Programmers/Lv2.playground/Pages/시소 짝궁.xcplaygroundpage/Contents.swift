import Foundation

func solution(_ weights:[Int]) -> Int64 {
    
    var result: Int64 = 0
    var weightsReal: [Int64] = Array(repeating: 0, count: 1001)
    var weightsDistance: [Int64] = Array(repeating: 0, count: 4001)
    
    
    for weight in weights {
        let distance2 = weight * 2
        let distance3 = weight * 3
        let distance4 = weight * 4
        
        result += weightsDistance[distance2]
        result += weightsDistance[distance3]
        result += weightsDistance[distance4]
        
        /*
         
         ex) 몸무게가 100인 사람이 있고 그 다음 같은 몸무게인 100이 들어올 때
         
         weightsDistance[distance2] = 1
         weightsDistance[distance3] = 1
         weightsDistance[distance4] = 1
         result = 3
         
         실제 시소 짝궁은 1명인데 2/3/4배 한 결과값이 같기 때문에 결과값은 3배(몸무게가 같은 사람의 수 * 3)가 됨
         그러므로 2배(몸무게가 같은 사람의 수 * 2)를 빼줘야한다
         */
        if 0 < weightsReal[weight] {
            result -= weightsReal[weight] * 2
        }
        
        weightsReal[weight] += 1
        weightsDistance[distance2] += 1
        weightsDistance[distance3] += 1
        weightsDistance[distance4] += 1
    }
    
    
    return result
}
