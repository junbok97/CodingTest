import Foundation

func solution(_ number:String, _ k:Int) -> String {
    
    var k = k
    var stack: [Character] = []
    
    let limit = number.count - k
    let number = number.map { $0 }
    
    for element in number {
        while !stack.isEmpty && 0 < k &&
                stack.last!.wholeNumberValue! < element.wholeNumberValue! {
            stack.removeLast()
            k -= 1
        }
        
        if stack.count < limit { stack.append(element) }
    }
    
    
    return String(stack)
}
