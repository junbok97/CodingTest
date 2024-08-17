import Foundation

struct Heap<T: Comparable> {
    var nodes: [T] = []
    let sort: (T, T) -> Bool
    
    init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }
    
    var isEmpty: Bool {
        nodes.isEmpty
    }
    
    mutating func insert(_ element: T) {
        var index = nodes.count
        nodes.append(element)
        while 0 < index && sort(nodes[index], nodes[(index-1)/2]) {
            nodes.swapAt(index, (index-1)/2)
            index = (index-1)/2
        }
    }
    
    mutating func pop() -> T {
        nodes.swapAt(0, nodes.count-1)
        let item = nodes.removeLast()
        var index = 0

        while (index * 2) + 1 < nodes.count {
            let leftChild = (index * 2) + 1
            let rightChild = leftChild + 1
            
            if rightChild < nodes.count {
                let child = sort(nodes[leftChild], nodes[rightChild]) ? leftChild : rightChild
                
                if sort(nodes[child], nodes[index]) {
                    nodes.swapAt(child, index)
                    index = child
                } else { break }
            } else {
                if sort(nodes[leftChild], nodes[index]) {
                    nodes.swapAt(leftChild, index)
                    index = leftChild
                } else { break }
            }
        }
        return item
    }
}

func solution(_ n:Int, _ k:Int, _ enemys:[Int]) -> Int {
    var n = n
    var k = k
    var count = 0
    var maxHeap: Heap = Heap<Int>(sort: >)
    
    for enemy in enemys {
        maxHeap.insert(enemy)
        if 0 <= n - enemy {
            n -= enemy
        } else if 0 < k {
            n = n - enemy + maxHeap.pop()
            k -= 1
        } else {
            return count
        }
        count += 1
    }
    return count
}
