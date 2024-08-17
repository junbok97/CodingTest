import Foundation

func solution(_ rsp:String) -> String {
    rsp.map { $0 == "0" ? "5" : $0 == "2" ? "0" : "2" }.joined()
}
