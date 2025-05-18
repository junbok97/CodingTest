//
//  MergeSort.swift
//  BAEKJOON
//
//  Created by 이준복 on 4/27/25.
//

import Foundation


func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
    var left = left
    var right = right
    var result: [T] = []
    
    while !left.isEmpty && !right.isEmpty {
        if left.first! < right.first! {
            result.append(left.removeFirst())
        } else {
            result.append(right.removeFirst())
        }
    }
    
    result.append(contentsOf: left)
    result.append(contentsOf: right)
    return result
}


func mergeSort<T: Comparable>(_ arr: [T]) -> [T] {
    if arr.count <= 1 { return arr }
    let mid = arr.count/2
    let left = mergeSort(Array(arr[0..<mid]))
    let right = mergeSort(Array(arr[mid..<arr.count]))
    return merge(left, right)
}

