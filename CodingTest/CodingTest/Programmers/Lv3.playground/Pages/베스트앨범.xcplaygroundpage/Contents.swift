import Foundation

struct Music {
    let id: Int
    let plays: Int
}

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    
    var result: [Int] = []
    var album: [String: [Music]] = [:]
    var totalPlays: [String: Int] = [:]
    
    for index in 0..<genres.count {
        let genre = genres[index]
        let plays = plays[index]
        let music = Music(id: index, plays: plays)
        
        if album[genre] == nil {
            album[genre] = [music]
            totalPlays[genre] = plays
        } else {
            album[genre]!.append(music)
            totalPlays[genre]! += plays
        }
    }
    
    for key in totalPlays.sorted(by: { $0.value > $1.value }).map({ $0.key }) {
        var answer: [Int] = []
        for music in album[key]!.sorted(by: { $0.plays > $1.plays }) {
            if 2 <= answer.count { break }
            answer.append(music.id)
        }
        result += answer
    }
    
    return result
}
