//
//  BinarySearch.swift
//  BAEKJOON
//
//  Created by 이준복 on 4/27/25.
//

import Foundation


func insertBinarySearch<T: Comparable>(array: [T], target: T) -> Bool {
    var start = 0
    var end = (array.count - 1)
    
    while start <= end {
        let mid = (start + end) / 2
        
        if array[mid] == num { return true }
        if array[mid] > num {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    return false
}

