import Foundation

extension String {
    var convert: String {
        self.replacingOccurrences(of: "C#", with: "c")
            .replacingOccurrences(of: "D#", with: "d")
            .replacingOccurrences(of: "F#", with: "f")
            .replacingOccurrences(of: "G#", with: "g")
            .replacingOccurrences(of: "A#", with: "a")
    }
}

func solution(_ m:String, _ musicinfos:[String]) -> String {
    
    let m = m.convert
    var result: [(title: String, time: Int)] = []
    
    for infoString in musicinfos {
        let music = infoString.components(separatedBy: ",")
        let start = music[0]
        let end = music[1]
        let title = music[2]
        let info = music[3].convert.map{String($0)}
        
        let startTime = start.components(separatedBy: ":").map{Int($0)!}
        let startHour = startTime[0]
        let startMinute = startTime[1]
        let endTime = end.components(separatedBy: ":").map{Int($0)!}
        let endHour = endTime[0]
        let endMinute = endTime[1]
        let playTime = (endHour - startHour) * 60 + endMinute - startMinute
        
        var fullInfo = ""
        for i in 0..<playTime {
            let index = i % info.count
            fullInfo += info[index]
        }
        
        if fullInfo.contains(m) { result.append((title, playTime)) }
    }

    return result.max{$0.time < $1.time}?.title ?? "(None)"
}
