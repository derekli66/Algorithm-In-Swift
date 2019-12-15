import DEQUE

public struct Stack<T> {
    private var deque = Deque<T>()

    public init() {}

    public var top: T? {
        return deque.last
    }

    public mutating func insert(_ val: T) {
        deque.insertBack(val)
    }

    public mutating func pop() -> T? {
        return deque.popBack()
    }

}
