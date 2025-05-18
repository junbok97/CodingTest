import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    
    // 자기 자신 제거
    let lost_unoverapped = lost.filter { !reserve.contains($0) }.sorted()
    var reserve_unoverapped = reserve.filter { !lost.contains($0) }.sorted()
    
    // 체육복을 빌려서 입을 수 있는 사람 수
    var unlost_count = 0
    
    // 잃은 사람들을 순서대로
    for lost_value in lost_unoverapped {
        // 여벌이 있는 사람들을 잃은 사람들과 다 대조
        for (reserve_index, reserve_value) in reserve_unoverapped.enumerated() {
            // 만약 여별이 있는 사람이 잃은 사람한테 빌려줄 수 있으면
            if (lost_value - 1) == reserve_value || (lost_value + 1) == reserve_value {
                unlost_count += 1
                // 여벌을 빌려 준 사람 제거
                reserve_unoverapped.remove(at: reserve_index)
                // reserve_index는 초기랑 똑같이 가기 때문에 한명한테 빌려줬으면 중단
                break
            }
        }
    }
    
    return n - lost_unoverapped.count + unlost_count
}
