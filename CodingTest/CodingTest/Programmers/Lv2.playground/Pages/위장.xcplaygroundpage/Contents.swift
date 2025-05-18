import Foundation

func solution(_ clothes:[[String]]) -> Int {
    
    let count = Set(clothes.compactMap({ $0.last })).map { type in
        return clothes.filter { $0.last == type }.count + 1
    }
    
    return count.reduce(1) { $0 * $1 } - 1
    
}

solution([["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]])

//func solution(_ clothes:[[String]]) -> Int {
//
//    var count = 1
//    var clothesType = [String : Int]()
//
//    for cloth in clothes {
//        if clothesType[cloth[1]] != nil {
//            clothesType[cloth[1]]! += 1
//        } else {
//            clothesType[cloth[1]] = 1
//        }
//    }
//
//    for (_, value) in clothesType {
//        count *= value + 1
//    }
//
//    return count - 1
//}
