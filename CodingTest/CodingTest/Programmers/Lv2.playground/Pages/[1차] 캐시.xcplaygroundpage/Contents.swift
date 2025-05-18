func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    
    var time = 0
    var cache = [String]()
    var cities = cities.map { $0.lowercased() }
    
    for city in cities {
        if cache.contains(city) {
            time += 1
            cache.remove(at: cache.firstIndex(of: city)!)
            cache.append(city)
        } else {
            time += 5
            cache.append(city)
            if cache.count > cacheSize {
                cache.removeFirst()
            }
        }
    }

    return time
}


//var time = 0
//var cache = [String]()
//var cities = cities.map { $0.lowercased() }
//
//if cacheSize == 0 {
//    return 5 * cities.count
//}
//
//for city in cities {
//    if cache.count < cacheSize {
//        if cache.index(of: city) != nil {
//            time += 1
//        } else {
//            cache.append(city)
//            time += 5
//        }
//        continue
//    }
//
//    if let index = cache.index(of: city) {
//        let str = cache.remove(at: index)
//        cache.append(city)
//        time += 1
//    } else {
//        cache.removeFirst()
//        cache.append(city)
//        time += 5
//    }
//}


//    if cacheSize == 0 {
//        return 5 * cities.count
//    }
//
//    var cities = cities.map { $0.lowercased() }
//
//    for i in 0..<cacheSize {
//        cache.append(cities[i])
//        time += 4
//    }
//
//    for city in cities {
//        hit = false
//        for i in 0..<cacheSize {
//            if cache[i] == city {
//                hit = true
//                var tmp = cache[cacheSize - 1]
//                cache[cacheSize - 1] = city
//                cache[i] = tmp
//                break
//            }
//        }
//        if hit {
//            time += 1
//        } else {
//            time += 5
//            cache.removeFirst()
//            cache.append(city)
//        }
//    }
//
