import DEQUE

public struct Queue<T> {
    private var deque = Deque<T>()

    public init() {}

    public var first: T? {
        return deque.first
    }

    public mutating func enqueue(_ val: T) {
        deque.insertBack(val)
    }

    public mutating func dequeue() -> T? {
        return deque.popFront()
    }

}
