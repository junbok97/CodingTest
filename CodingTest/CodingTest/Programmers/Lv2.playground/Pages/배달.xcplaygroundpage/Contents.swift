import Foundation

struct MaxHeap<T: Comparable> {
    var heap: Array<T> = []
    var isEmpty: Bool {
        return heap.count <= 1 ? true : false
    }
    
    init() { }
    init(_ data: T) {
        heap.append(data)       // 0번 index 채우기용
        heap.append(data)       // 실제 Root Node 채우기
    }

    mutating func insert(_ data: T) {
        if heap.isEmpty {
            heap.append(data)
            heap.append(data)
            return
        }
        heap.append(data)
        
        func isMoveUp(_ insertIndex: Int) -> Bool {
            if insertIndex <= 1 {               // 루트 노드일 때
                return false
            }
            let parentIndex: Int = insertIndex / 2
            return heap[insertIndex] > heap[parentIndex] ? true : false
        }
        
        var insertIndex: Int = heap.count - 1
        while isMoveUp(insertIndex) {
            let parentIndex: Int = insertIndex / 2
            heap.swapAt(insertIndex, parentIndex)
            insertIndex = parentIndex
        }
    }
    
    enum moveDownStatus { case left, right, none }
    
    mutating func pop() -> T? {
        if heap.count <= 1 { return nil }
        
        let returnData = heap[1]
        heap.swapAt(1, heap.count - 1)
        heap.removeLast()
        
        func moveDown(_ poppedIndex: Int) -> moveDownStatus {
            let leftChildIndex = (poppedIndex * 2)
            let rightCildIndex = leftChildIndex + 1
            
            // case1. 모든(왼쪽) 자식 노드가 없는 경우 (완전이진트리는 왼쪽부터 채워지므로)
            if leftChildIndex >= (heap.count) {
                return .none
            }
            
            // case2. 왼쪽 자식 노드만 있는 경우
            if rightCildIndex >= (heap.count) {
                return heap[leftChildIndex] > heap[poppedIndex] ? .left : .none
            }
            
            // case3. 왼쪽 & 오른쪽 자식 노드 모두 있는 경우
            // case 3-1. 자식들이 자신보다 모두 작은 경우
            if (heap[leftChildIndex] < heap[poppedIndex]) && (heap[rightCildIndex] < heap[poppedIndex]) {
                return .none
            }
            
            // case 3-2. 자식들이 자신보다 모두 큰 경우 (왼쪽과 오른쪽 자식 중 더 큰 자식 선별)
            if (heap[leftChildIndex] > heap[poppedIndex]) && (heap[rightCildIndex] > heap[poppedIndex]) {
                return heap[leftChildIndex] > heap[rightCildIndex] ? .left : .right
            }
            
            // case 3-3. 왼쪽 & 오른쪽 중 한 자식만 자신보다 큰 경우
            return heap[leftChildIndex] > heap[poppedIndex] ? .left : .right
        }
        
        var poppedIndex = 1
        while true {
            switch moveDown(poppedIndex) {
            case .none:
                return returnData
            case .left:
                let leftChildIndex = poppedIndex * 2
                heap.swapAt(poppedIndex, leftChildIndex)
                poppedIndex = leftChildIndex
            case .right:
                let rightChildIndex = (poppedIndex * 2) + 1
                heap.swapAt(poppedIndex, rightChildIndex)
                poppedIndex = rightChildIndex
                
            }
        }
    }
}

struct NodePriority: Comparable {
    static func < (lhs: NodePriority, rhs: NodePriority) -> Bool {
        lhs.priority > rhs.priority
    }
    var node: Int = 0
    var priority: Int = 0
}

func dijkstra(graph: [Int: [Int: Int]], start: Int) ->  [Int: Int] {
    var distances: [Int: Int] = [:]
    var priorityQueue = MaxHeap(NodePriority.init(node: start, priority: 0))
    
    for key in graph.keys {
        let value = key == start ? 0 : Int.max
        distances.updateValue(value, forKey: key)
    }
    
    while !priorityQueue.isEmpty {
        guard let popped = priorityQueue.pop() else { break }
        
        if distances[popped.node]! < popped.priority {
            continue
        }
        
        for (node, priority) in graph[popped.node]! {
            let distance = priority + popped.priority
            if distance < distances[node]! {
                distances[node] = distance
                priorityQueue.insert(NodePriority.init(node: node, priority: distance))
            }
        }
    }
    return distances
}

func solution(_ N:Int, _ roads:[[Int]], _ k:Int) -> Int {
    var graph: [Int : [Int: Int]] = [:]
    
    (1...N).forEach {
        graph[$0] = [:]
    }
    
    for road in roads {
        if let value = graph[road[0]]![road[1]] {
            graph[road[0]]![road[1]] = road[2] < value ? road[2] : value
        } else {
            graph[road[0]]![road[1]] = road[2]
        }
            
        if let value = graph[road[1]]![road[0]] {
            graph[road[1]]![road[0]] = road[2] < value ? road[2] : value
        } else {
            graph[road[1]]![road[0]] = road[2]
        }
    }
        
    return dijkstra(graph: graph, start: 1).filter { $0.value <= k }.count
}


// 플로이드
func solution2(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var distance = [[Int]](repeating: [Int](repeating: 99999999, count: N), count: N)

    for i in 0..<N {
        distance[i][i] = 0
    }

    for i in road {
        distance[i[0]-1][i[1]-1] = min(i[2], distance[i[0]-1][i[1]-1])
        distance[i[1]-1][i[0]-1] = min(i[2], distance[i[1]-1][i[0]-1])
    }

    for k in 0..<N {
        for i in 0..<N {
            for j in 0..<N {
                distance[i][j] = min(distance[i][j], distance[i][k] + distance[k][j])
            }
        }
    }

    return distance.first!.filter{$0<=k}.count
}

