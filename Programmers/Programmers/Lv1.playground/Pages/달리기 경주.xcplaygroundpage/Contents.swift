import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var players = players
    var rank: [String: Int] = Dictionary(uniqueKeysWithValues: zip(players, 0..<players.count))
    
    callings.forEach { calling in
        let index = rank[calling]!
        let overtakenPlayer = players[index - 1]
        players.swapAt(index, index-1)
        rank[calling]! -= 1
        rank[overtakenPlayer]! += 1
    }
    
    return players
}
