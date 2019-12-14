import Foundation

final class ListNode<T> {
    var val: T
    var next: ListNode<T>?
    weak var parent: ListNode<T>?

    deinit {
        // debugPrint("[Debug] val \(val) got dealloc.")
    }

    init(_ value: T) {
        val = value
    }

    func copy() -> ListNode {
        let newNode = ListNode(val)
        newNode.next = next?.copy()
        newNode.next?.parent = newNode
        newNode.parent = parent
        return newNode
    }
}

public struct Deque<T> {
    typealias Node = ListNode<T>
    private var head: Node?
    private var tail: Node?

    var first: T? {
        return head?.val
    }

    var last: T? {
        return tail?.val
    }

    private mutating func copyAndReplaceLinkedList() {
        guard let headNode = head else { return }

        let newHeadNode = headNode.copy()
        var currentNode = newHeadNode
        while nil != currentNode.next {
            currentNode = currentNode.next!
        }

        tail = currentNode
        head = newHeadNode
    }

    mutating func insertBack(_ val: T) {
        assert(!((nil == head) ^ (nil == tail)), "The head node and tail node must be both null or both unnull")

        let newNode = Node(val)
        if nil == tail {
            tail = newNode
            head = tail
        } else {
            if !isKnownUniquelyReferenced(&head) {
                debugPrint("[Debug] copy and replace was performed.")
                copyAndReplaceLinkedList()
                debugPrint("[Debug] copy and replace was finished.")
            }

            tail?.next = newNode
            newNode.parent = tail
            tail = tail?.next
        }
    }

    @discardableResult
    mutating func popBack() -> T? {
        assert(!((nil == head) ^ (nil == tail)), "The head node and tail node must be both null or both unnull")

        if !isKnownUniquelyReferenced(&head) {
            debugPrint("[Debug] copy and replace was performed.")
            copyAndReplaceLinkedList()
            debugPrint("[Debug] copy and replace was finished.")
        }

        let deleted = tail
        if deleted! === head! {
            head = nil
            tail = nil
        } else {
            tail = tail?.parent
            tail?.next = nil
        }

        return deleted?.val
    }

    mutating func insertFront(_ val: T) {
        assert(!((nil == head) ^ (nil == tail)), "The head node and tail node must be both null or both unnull")

        let newNode = Node(val)
        if nil == head {
            head = newNode
            tail = head
        } else {
            if !isKnownUniquelyReferenced(&head) {
                debugPrint("[Debug] copy and replace was performed.")
                copyAndReplaceLinkedList()
                debugPrint("[Debug] copy and replace was finished.")
            }

            let temp = head
            head = newNode
            head?.next = temp
            temp?.parent = head
        }
    }

    @discardableResult
    mutating func popFront() -> T? {
        assert(!((nil == head) ^ (nil == tail)), "The head node and tail node must be both null or both unnull")

        if !isKnownUniquelyReferenced(&head) {
            debugPrint("[Debug] copy and replace was performed.")
            copyAndReplaceLinkedList()
            debugPrint("[Debug] copy and replace was finished.")
        }

        let deleted = head
        if deleted! === tail! {
            head = nil
            tail = nil
        } else {
            head = head?.next
            head?.parent = nil
        }

        deleted?.next = nil
        return deleted?.val
    }
}

private extension Bool {
    static func ^ (left: Bool, right: Bool) -> Bool {
        return left != right
    }
}
