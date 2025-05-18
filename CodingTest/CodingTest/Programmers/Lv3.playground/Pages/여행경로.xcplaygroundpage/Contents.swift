import Foundation

// -------- 방법1 -------- //
func dfs(_ startCity: String, _ tickets: [[String]], _ root: [String], _ results: inout [[String]]) {
    var root = root
    root.append(startCity)
    
    if tickets.isEmpty {
        results.append(root)
        return
    }

    tickets.enumerated().filter { (offset, element) in
        element[0] == startCity
    }.map { (offset, element) in
        var remainingTickets = tickets
        remainingTickets.remove(at: offset)
        dfs(element[1], remainingTickets, root, &results)
    }
}

func solution(_ tickets:[[String]]) -> [String] {
    var results: [[String]] = []
    let tickets = tickets.sorted { $0[1] < $1[1] }
    dfs("ICN", tickets, [], &results)
    return results.first!
}
// -------- 방법1 -------- //



// -------- 방법2 -------- //
func solution2(_ tickets:[[String]]) -> [String] {
    let tickets = tickets.sorted { $0[1] < $1[1] }
    var route = ["ICN"]
    let isTicketUsed = Array(repeating: false, count: tickets.count)
    tickets.dfs("ICN", isTicketUsed, 0, &route)
    return route
}

extension Array where Element == [String] {
    func dfs(_ current: String, _ isTicketUsed: [Bool], _ usedTicketCount: Int, _ route: inout [String]) -> Bool {
        if usedTicketCount == self.count { return true }
        var isTicketUsed = isTicketUsed

        for i in self.indices {
            if self[i][0] == current && !isTicketUsed[i] {
                isTicketUsed[i] = true
                route.append(self[i][1])
                let found = dfs(self[i][1], isTicketUsed, usedTicketCount+1, &route)
                if found { return true }
                isTicketUsed[i] = false
                route.popLast()!
            }
        }
        return false
    }
}
// -------- 방법2 -------- //
