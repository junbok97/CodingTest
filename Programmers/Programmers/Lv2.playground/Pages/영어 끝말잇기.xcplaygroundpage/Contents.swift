import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    
    var wordDB = [String]()
    
    for i in 1..<words.count {
        
        let word = words[i]
        
        if word.count < 1 { return [i%n + 1, i/n + 1] }
        
        if wordDB.contains(word) { return [i%n + 1, i/n + 1] }
        
        if wordDB.count != 0 {
            if wordDB[wordDB.count - 1].last != word.first {
                return [i%n + 1, i/n + 1]
            }
        }
        
        wordDB.append(word)
        
    }

    return [0,0]
}

func solution2(_ n:Int, _ words:[String]) -> [Int] {
    for i in 1..<words.count {
        if (words[i-1].last != words[i].first) || (words[0..<i].contains(words[i])){
            return [i % n + 1, i / n + 1]
        }
    }
    return [0,0]
}
