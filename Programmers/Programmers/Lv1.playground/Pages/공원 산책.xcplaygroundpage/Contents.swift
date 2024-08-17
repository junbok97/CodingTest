import Foundation

func moveCol(_ park: [[String]], _ x: Int, _ start: Int, _ finish: Int) -> Bool {
    if start < 0 || park[0].count <= finish {
        return false
    }

    for j in start...finish {
        if park[x][j] == "X" {
            return false
        }
    }
    
    return true
}

func moveRow(_ park: [[String]], _ y: Int, _ start: Int, _ finish: Int) -> Bool {
    if start < 0 || park.count <= finish {
        return false
    }
    
    for i in start...finish {
        if park[i][y] == "X" {
            return false
        }
    }
    
    return true
}


func solution(_ park:[String], _ routes:[String]) -> [Int] {
    var x = 0
    var y = 0
    
    let park: [[String]] = park.enumerated().map { (i, str) in
        str.enumerated().map { (j, char) in
            if char == "S" {
                x = i
                y = j
            }
            return String(char)
        }
    }
    
    for route in routes {
        switch route.first! {
        case "E":
            if moveCol(park, x, y, y + route.last!.wholeNumberValue!) {
                y += route.last!.wholeNumberValue!
            }
        case "W":
            if moveCol(park, x, y - route.last!.wholeNumberValue!, y) {
                y -= route.last!.wholeNumberValue!
            }
        case "N":
            if moveRow(park, y, x - route.last!.wholeNumberValue!, x) {
                x -= route.last!.wholeNumberValue!
            }
        case "S":
            if moveRow(park, y, x, x + route.last!.wholeNumberValue!) {
                x += route.last!.wholeNumberValue!
            }
        default:
            continue
        }

    }
    
    return [x,y]
}
