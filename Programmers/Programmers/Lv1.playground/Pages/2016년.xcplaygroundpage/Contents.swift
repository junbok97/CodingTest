import Foundation

func solution(_ a:Int, _ b:Int) -> String {
    
    let day = ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"]
    let month = [0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    var total_day = b
    
    for i in 0..<a {
        total_day += month[i]
    }
    
    return day[total_day % 7]
}
