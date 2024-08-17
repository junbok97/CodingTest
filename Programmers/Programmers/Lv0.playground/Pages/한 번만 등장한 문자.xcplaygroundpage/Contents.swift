import Foundation

func solution(_ s:String) -> String {
    
    var been = ""
    var result = ""
    
    s.sorted().forEach {
        if !been.contains($0) {
            been += String($0)
        } else {
            result += String($0)
        }
    }
    
    
    
    been.removeAll { result.contains($0) }
    return been
}

//func solution(_ s: String) -> String {
//    return Dictionary(grouping: Array(s).map(String.init), by: { $0 }).filter { $0.value.count <= 1 }
//        .map { $0.key }
//        .sorted(by: <)
//        .joined()
//}
