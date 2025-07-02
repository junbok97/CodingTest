import Foundation

final class Delegate {
    
}

final class A {
    weak var delegate: Delegate? {
        willSet {
            print("Will Set", delegate)
        }
        
        didSet {
            print("DidSet Set", delegate)
        }
    }
    
}





let a = A()
var delegate: Delegate? = Delegate()
a.delegate = delegate
delegate = nil

