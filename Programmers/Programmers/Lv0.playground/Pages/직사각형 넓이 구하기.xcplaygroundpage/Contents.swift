import Foundation

func solution(_ dots:[[Int]]) -> Int {
    
    let arrX = dots.map { $0[0] }
    let arrY = dots.map { $0[1] }
    
    let length = arrX.max()! - arrX.min()!
    let height = arrY.max()! - arrY.min()!
    
    return abs(length * height)
}
