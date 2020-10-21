class Node {
    var key: Int
    var left: Node?
    var right: Node?
    var parent: Node?

    init(_ key: Int) {
        self.key = key
    }
}

func successor(_ root: Node) -> Node? {
    if root.right != nil {
        return root.right
    }

    if root.parent == nil {
        return nil
    }

    var current = root
    var parent = current.parent

    while parent?.right != nil && parent!.right! === current {
        current = parent!
        parent = current.parent
    }

    return parent
}
