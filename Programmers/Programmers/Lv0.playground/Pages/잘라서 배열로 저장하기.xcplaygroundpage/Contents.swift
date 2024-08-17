import Foundation

func solution(_ my_str:String, _ n:Int) -> [String] {

    let my_str = Array(my_str)
    var result = [String]()

    for i in stride(from: 0, to: my_str.count, by: n) {
        let j = i + n - 1
        j < my_str.count ? result.append(my_str[i...j].reduce("") {$0 + String($1)}) : result.append(my_str[i...my_str.count - 1].reduce("") {$0 + String($1)})
    }

    return result
}

solution("abc1Addfggg4556b",6)


