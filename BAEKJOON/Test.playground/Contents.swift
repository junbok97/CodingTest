import Foundation
import RegexBuilder


let str = "cstaw"
let regex = "[aeiou]"

if let range = str.range(of: regex, options: .regularExpression)  {
    print("true")
  
}

