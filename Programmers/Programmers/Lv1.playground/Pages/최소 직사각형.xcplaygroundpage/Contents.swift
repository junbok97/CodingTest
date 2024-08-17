import Foundation

//func solution(_ sizes:[[Int]]) -> Int {
//
//    var sort_sizes = [[Int]]()
//
//    for size in sizes {
//        if size[0] < size[1] {
//            sort_sizes.append([size[1],size[0]])
//        } else {
//            sort_sizes.append(size)
//        }
//    }
//
//
//    var length: Int = sort_sizes[0][0]
//    var hegiht: Int = sort_sizes[0][1]
//
//    for sort_size in sort_sizes {
//        if length < sort_size[0] {
//            length = sort_size[0]
//        }
//        if hegiht < sort_size[1] {
//            hegiht = sort_size[1]
//        }
//    }
//
//
//    return length * hegiht
//}


func solution(_ sizes:[[Int]]) -> Int {
    let sort_sizes = sizes.map{$0.sorted()}
    return sort_sizes.map{$0[0]}.max()! * sort_sizes.map{$0[1]}.max()!
}

