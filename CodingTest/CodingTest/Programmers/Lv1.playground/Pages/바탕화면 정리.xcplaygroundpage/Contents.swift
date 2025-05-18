import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    var lux = 51, luy = 51, rdx = -1, rdy = -1
    
    for (i, str) in wallpaper.enumerated() {
        for (j, file) in str.enumerated() {
            if file == "#" {
                lux = min(lux, i)
                luy = min(luy, j)
                rdx = max(rdx, i)
                rdy = max(rdy, j)
            }
        }
    }
    
    return [lux, luy, rdx + 1, rdy + 1]
}
