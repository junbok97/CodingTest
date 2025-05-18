import Foundation

enum Mineral: String {
    case diamond
    case iron
    case stone
    
    var diamondPick: Int {
        switch self {
        case .diamond:
            return 1
        case .iron:
            return 1
        case .stone:
            return 1
        }
    }
    
    var ironPick: Int {
        switch self {
        case .diamond:
            return 5
        case .iron:
            return 1
        case .stone:
            return 1
        }
    }

    var stonePick: Int {
        switch self {
        case .diamond:
            return 25
        case .iron:
            return 5
        case .stone:
            return 1
        }
    }

}

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    
    var diamondPickCount = picks[0]
    var diamondPickWorkVolumes: [Int] = []
    var ironPickCount = picks[1]
    var ironPickWorkVolumes: [Int] = []
    var stonePickCount = picks[2]
    var stonePickWorkVolumes: [Int] = []
    
    let newMinerals: [Mineral] = minerals.map { Mineral(rawValue: $0)! }
    let lastMineralIndex = min(newMinerals.count, (diamondPickCount + ironPickCount + stonePickCount) * 5)
    let workMinerals = newMinerals[0..<lastMineralIndex]
    
    var diamondPickWorkVolume = 0
    var ironPickWorkVolume = 0
    var stonePickWorkVolume = 0
    
    for (index, mineral) in workMinerals.enumerated() {
        diamondPickWorkVolume += mineral.diamondPick
        ironPickWorkVolume += mineral.ironPick
        stonePickWorkVolume += mineral.stonePick
        
        if (index+1) % 5 == 0 {
            diamondPickWorkVolumes.append(diamondPickWorkVolume)
            diamondPickWorkVolume = 0
            ironPickWorkVolumes.append(ironPickWorkVolume)
            ironPickWorkVolume = 0
            stonePickWorkVolumes.append(stonePickWorkVolume)
            stonePickWorkVolume = 0
        }
    }
    
    if workMinerals.count % 5 != 0 {
        diamondPickWorkVolumes.append(diamondPickWorkVolume)
        ironPickWorkVolumes.append(ironPickWorkVolume)
        stonePickWorkVolumes.append(stonePickWorkVolume)
    }
    
    
    let workIndexs = stonePickWorkVolumes.enumerated()
        .sorted { $0.element > $1.element }
        .map { $0.offset }
    
    var result = 0
    
    for index in workIndexs {
        if 0 < diamondPickCount {
            result += diamondPickWorkVolumes[index]
            diamondPickCount -= 1
        } else if 0 < ironPickCount {
            result += ironPickWorkVolumes[index]
            ironPickCount -= 1
        } else {
            result += stonePickWorkVolumes[index]
            stonePickCount -= 1
        }
    }
    
    return result
}

//solution([1, 3, 2], ["diamond", "diamond", "diamond", "iron", "iron", "diamond", "iron", "stone"])
//solution([0, 1, 1], ["diamond", "diamond", "diamond", "diamond", "diamond", "iron", "iron", "iron", "iron", "iron", "diamond"])
solution([0, 0, 1], ["stone", "stone", "stone", "stone", "stone", "diamond"])
