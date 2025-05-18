import Foundation

func solution(_ array:[Int]) -> Int {
    
    let result = Set(array).map { num in
        (num: num, count: array.filter { $0 == num }.count)
    }.sorted { $0.count > $1.count }

    return result.count > 1 && result[0].count == result[1].count ? -1 : result[0].num
    
}


//func solution(_ array: [Int]) -> Int {
//    let sorted = Dictionary(grouping: array) { $0 }.sorted { $0.value.count > $1.value.count }
//    return sorted.count > 1 && sorted[0].value.count == sorted[1].value.count ? -1 : sorted[0].key
//}
