import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    return zip(progresses, speeds)
        .map { (100 - $0 + ($1 - 1)) / $1 }
        .reduce(([], 0)) { (tuple, day) -> ([Int], Int) in
            let (list, lastMax) = tuple
            guard let lastCount = list.last else {
                return ([1], day)
            }
            if lastMax >= day {
                return (list.dropLast() + [lastCount + 1], lastMax)
            }
            return (list + [1], day)
        }.0
}




solution([93, 30, 55],[1, 30, 5])


//
//func solution2(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
//    let days = zip(progresses, speeds).map { (percent, speed) -> Int in
//        let remains = 100 - percent
//        let required = remains / speed
//        print("\(remains) \(required) \(speed)")
//        return remains % speed == 0 ? required : required + 1
//    }
//
//    var stack = [(day: Int, count: Int)]()
//
//    for day in days {
//        if let lastElement = stack.last {
//            if lastElement.day >= day {
//                stack.removeLast()
//                stack.append((lastElement.day, lastElement.count + 1))
//                continue
//            }
//        }
//
//        stack.append((day, 1))
//    }
//
//    return stack.map { $0.count }
//}


//
//import Foundation
//
//func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
//
//    var result = [Int]()
//
//    let days = zip(progresses, speeds).map { (progress, speed) -> Int in
//        let work = (100 - progress) / speed
//        return work % speed == 0 ? work : work + 1
//    }
//
//    var complete = days[0]
//    var count = 0
//
//    for day in days {
//        if complete >= day {
//            count += 1
//        } else {
//            result.append(count)
//            complete = day
//            count = 1
//        }
//    }
//
//    result.append(count)
//
//    return result
//}

//func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
//
//    var progresses = progresses
//    var speeds = speeds
//    var result = [Int]()
//    var count = 0
//    var tmp = 0
//
//    while !progresses.isEmpty {
//        tmp = (100 - progresses[0]) / speeds[0]
//        for i in 0..<progresses.count {
//            progresses[i] += (speeds[i] * tmp)
//        }
//
//        for progress in progresses {
//            if progress >= 100 {
//                progresses.removeFirst()
//                speeds.removeFirst()
//                count += 1
//            } else {
//                result.append(count)
//                count = 0
//                break
//            }
//        }
//    }
//
//    result.append(count)
//
//    return result
//}
