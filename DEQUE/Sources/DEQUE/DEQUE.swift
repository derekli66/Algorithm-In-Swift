import Foundation

final class ListNode<T> {
    var val: T
    var next: ListNode<T>?
    var parent: ListNode<T>?
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

/*
    TODO: The pop functions did not have correct pop implementation.
          The move impl on head and tail did not care about the null end set up.
          Should also consider the unique reference case when popping head and tail.
    TODO: The usage of copy() should copy head and tail at the same time. 
*/

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

    mutating func insertBack(_ val: T) {
        assert(!((nil == head) ^ (nil == tail)), "The head node and tail node must be both null or both unnull")

        let newNode = Node(val)
        if nil == tail {
            tail = newNode
            head = tail
        } else {
            if !isKnownUniquelyReferenced(&tail) {
                let tailCopy = tail?.copy()

                if head! === tail! {
                    tail = tailCopy
                    head = tail
                } else {
                    tail = tailCopy
                }
            }

            tail?.next = newNode
            newNode.parent = tail
            tail = tail?.next
        }
    }

    @discardableResult
    mutating func popBack() -> T? {
        assert(!((nil == head) ^ (nil == tail)), "The head node and tail node must be both null or both unnull")

        let deleted = tail
        if deleted! === head! {
            head = nil
            tail = nil
        } else {
            tail = tail?.parent
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
                if head! === tail! {
                    let headCopy = head?.copy()
                    head = headCopy
                    tail = head
                } 
                else {
                    let next = head?.next
                    // To prevent copy all linked nodes, set head's next node to nil,
                    // the connect next node after copying
                    head?.next = nil
                    head = head?.copy()
                    head?.next = next
                }
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

        let deleted = head
        if deleted! === tail! {
            head = nil
            tail = nil
        } else {
            head = head?.next
        }

        return deleted?.val
    }
}

private extension Bool {
    static func ^ (left: Bool, right: Bool) -> Bool {
        return left != right
    }
}
