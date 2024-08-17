// 1. 다음과제.시작시간 - 현재과제.시작시간 = 과제실행가능시간
// 2. 현재과제.실행시간 - 과제실행가능시간 = 남은실행시간
// 2-1 남은실행시간 == 1
// 1. 로 돌아가 반복
// 2-2 남은실행시간 > 0
// pasueTask.append(현재과제) 현재과제.실행시간 = 남은실행시간
// 2-3 남은실행시간 < 0
// 멈춘과제 = pasueTask.removeLast()
// 멈춘과제.실행시간 - 남은실행시간
// 2로 반복

import Foundation

struct Plan {
    let subject: String
    let startTime: Int
    var runningTime: Int
    
    init(subject: String, startTime: String, runningTime: String) {
        self.subject = subject
        let separatedTime = startTime.components(separatedBy: ":")
        self.startTime = Int(separatedTime.first!)! * 60 + Int(separatedTime.last!)!
        self.runningTime = Int(runningTime)!
    }
}

func solution(_ plans:[[String]]) -> [String] {
    
    var planList: [Plan] = plans
        .map { Plan(subject: $0[0], startTime: $0[1], runningTime: $0[2]) }
        .sorted { $0.startTime < $1.startTime }
    
    var pauseTask: [Plan] = []
    var result: [String] = []

    while true {
        var plan = planList.removeFirst()
        
        if planList.isEmpty {
            result.append(plan.subject)
            break
        }
        
        let runableTime = planList.first!.startTime - plan.startTime
        // 시간이 남으면 음수
        var remainingTime = plan.runningTime - runableTime
        
        if remainingTime == 0 {
            result.append(plan.subject)
            continue
        }
        else if 0 < remainingTime {
            plan.runningTime = remainingTime
            pauseTask.append(plan)
            continue
        } else {
            result.append(plan.subject)
            while !pauseTask.isEmpty  {
                var resumePlan = pauseTask.removeLast()
                remainingTime = resumePlan.runningTime + remainingTime
                
                if remainingTime <= 0 {
                    result.append(resumePlan.subject)
                    continue
                } else if 0 < remainingTime {
                    resumePlan.runningTime = remainingTime
                    pauseTask.append(resumePlan)
                    break
                }
            }
        }
    }
    pauseTask.reversed().forEach { result.append($0.subject) }
    
    return result
}

//
//solution([["korean", "11:40", "30"], ["english", "12:10", "20"], ["math", "12:30", "40"]])
//solution([["science", "12:40", "50"], ["music", "12:20", "40"], ["history", "14:00", "30"], ["computer", "12:30", "100"]])
//solution([["aaa", "12:00", "20"], ["bbb", "12:10", "30"], ["ccc", "12:40", "10"]])
//
