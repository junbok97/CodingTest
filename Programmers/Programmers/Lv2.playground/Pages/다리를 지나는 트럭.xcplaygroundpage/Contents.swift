import Foundation

func solution(_ 다리길이:Int, _ 무게제한:Int, _ 트럭들무게:[Int]) -> Int {
    var 진행시간 = 0
    var 건너는중: [Int] = []
    var 무게제한 = 무게제한
    var 트럭들무게 = 트럭들무게
    
    while !(트럭들무게.isEmpty && 건너는중.isEmpty) {
        진행시간 += 1
        if  다리길이 < 진행시간 {
            무게제한 += 건너는중.removeFirst()
        }
        
        if let 첫번째트럭무게 = 트럭들무게.first {
            if 첫번째트럭무게 <= 무게제한 {
                건너는중.append(트럭들무게.first!)
                무게제한 -= 트럭들무게.removeFirst()
            } else {
                건너는중.append(0)
            }
        }
    }
    
    return 진행시간
}
