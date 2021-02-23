//
//  AVLTree.swift
//  AVLTree
//
//  Created by LEE CHIEN-MING on 2021/2/20.
//

import Foundation

public class TreeNode {
    init(val: Int, lNode: TreeNode? = nil, rNode: TreeNode? = nil) {
        self.val = val
        self.leftNode = lNode
        self.rightNode = rNode
    }
    
    var leftNode: TreeNode?
    var rightNode: TreeNode?
    var val: Int
    var height: Int = 1
}

public class AVLTree {
    private var root: TreeNode?
    
    init(root: TreeNode? = nil) {
        self.root = root
    }
    
    func insert(_ val: Int) {
        if let root = self.root {
            _ = self.recursiveInsert(root, val: val)
        }
        else {
            self.root = TreeNode(val: val)
        }
    }
    
    func findValue(_ val: Int) -> Bool {
        var node = self.root
        
        while node != nil {
            
            if val < node!.val {
                node = node?.leftNode
            }
            else if val > node!.val {
                node = node?.rightNode
            }
            else {
                return true
            }
        }
        
        return false
    }
    
    func remove(_ val: Int) {
        self.root = recursiveRemove(self.root, val)
    }
    
    func successor(_ val: Int) -> Int? {
        return self.successor(self.root, val: val)?.val
    }
    
    func predecessor(_ val: Int) -> Int? {
        return self.predecessor(self.root, val: val)?.val
    }
    
    @discardableResult
    func printHeight() -> [Int:Int] {
        guard let root = self.root else {
            return [:]
        }
        
        var nodeHeights: [Int:Int] = [:]
        self.inorderPrintHeight(root, nodeHeights: &nodeHeights)
        
        return nodeHeights
    }
    
    func sort() -> [Int] {
        var result = [Int]()
        self.inorderTraversal(self.root, sorted: &result)
        return result
    }
    
    private func updateHeight(_ node: TreeNode?) {
        guard let node = node else {
            return
        }
        
        self.updateHeight(node.leftNode)
        self.updateHeight(node.rightNode)
        
        node.height = 1 + max(node.leftNode?.height ?? 0, node.rightNode?.height ?? 0)
    }
    
    private func leftRotation(_ node: TreeNode) -> TreeNode? {
        let newRoot = node.rightNode
        node.rightNode = newRoot?.leftNode
        newRoot?.leftNode = node
        self.updateHeight(node)
        self.updateHeight(newRoot)
        return newRoot
    }
    
    private func rightRotation(_ node: TreeNode) -> TreeNode? {
        let newRoot = node.leftNode
        node.leftNode = newRoot?.rightNode
        newRoot?.rightNode = node
        self.updateHeight(node)
        self.updateHeight(newRoot)
        return newRoot
    }
    
    private func recursiveInsert(_ node: TreeNode?, val: Int) -> TreeNode? {
        guard var parent = node else {
            return TreeNode(val: val)
        }
        
        if val <= parent.val {
            parent.leftNode =  self.recursiveInsert(parent.leftNode, val: val)
        }
        else if val > parent.val {
            parent.rightNode = self.recursiveInsert(parent.rightNode, val: val)
        }
        
        let balanceFactor = (parent.leftNode?.height ?? 0) - (parent.rightNode?.height ?? 0)
        if balanceFactor > 1 {
            if (parent.leftNode?.leftNode?.height ?? 0) > (parent.leftNode?.rightNode?.height ?? 0) {
                self.rightRotation(parent).map {
                    if parent === self.root { self.root = $0}
                    parent = $0
                }
            }
            else {
                if let leftNode = parent.leftNode {
                    self.leftRotation(leftNode).map {
                        parent.leftNode = $0
                    }
                }
                self.rightRotation(parent).map {
                    if parent === self.root { self.root = $0}
                    parent = $0
                }
            }
            
        }
        else if balanceFactor < -1 {
            if (parent.rightNode?.rightNode?.height ?? 0) > (parent.rightNode?.leftNode?.height ?? 0) {
                self.leftRotation(parent).map {
                    if parent === self.root { self.root = $0}
                    parent = $0
                }
            }
            else {
                if let rightNode = parent.rightNode {
                    self.rightRotation(rightNode).map {
                        parent.rightNode = $0
                    }
                }
                self.leftRotation(parent).map {
                    if parent === self.root { self.root = $0}
                    parent = $0
                }
            }
        }
        else {
            updateHeight(parent)
        }
        
        return parent
    }
    
    private func minValue(_ rootNode: TreeNode) -> Int {
        if rootNode.leftNode == nil {
            return rootNode.val
        }
        return self.minValue(rootNode.leftNode!)
    }
    
    private func recursiveRemove(_ node: TreeNode?, _ val: Int) -> TreeNode? {
        guard var parent = node else {
            return nil
        }
        
        if val < parent.val {
            parent.leftNode = self.recursiveRemove(parent.leftNode, val)
        }
        else if val > parent.val {
            parent.rightNode = self.recursiveRemove(parent.rightNode, val)
        }
        else {
            if parent.leftNode == nil {
                return parent.rightNode
            }
            else if parent.rightNode == nil {
                return parent.leftNode
            }
            else {
                // This is guaranteed to be non-nil node.
                let rightMinValue = self.minValue(parent.rightNode!)
                parent.val = rightMinValue
                parent.rightNode = self.recursiveRemove(parent.rightNode, rightMinValue)
            }
        }
        
        self.updateHeight(parent)
        
        let balanceFactor = (parent.leftNode?.height ?? 0) - (parent.rightNode?.height ?? 0)
        if balanceFactor > 1 {
            if (parent.leftNode?.leftNode?.height ?? 0) > (parent.leftNode?.rightNode?.height ?? 0) {
                self.rightRotation(parent).map {
                    if parent === self.root { self.root = $0}
                    parent = $0
                }
            }
            else {
                if let leftNode = parent.leftNode {
                    self.leftRotation(leftNode).map {
                        parent.leftNode = $0
                    }
                }
                self.rightRotation(parent).map {
                    if parent === self.root { self.root = $0}
                    parent = $0
                }
            }
            
        }
        else if balanceFactor < -1 {
            if (parent.rightNode?.rightNode?.height ?? 0) > (parent.rightNode?.leftNode?.height ?? 0) {
                self.leftRotation(parent).map {
                    if parent === self.root { self.root = $0}
                    parent = $0
                }
            }
            else {
                if let rightNode = parent.rightNode {
                    self.rightRotation(rightNode).map {
                        parent.rightNode = $0
                    }
                }
                self.leftRotation(parent).map {
                    if parent === self.root { self.root = $0}
                    parent = $0
                }
            }
        }
        else {
            updateHeight(parent)
        }
        
        return parent
    }
    
    private func minNode(_ rootNode: TreeNode?) -> TreeNode? {
        if rootNode?.leftNode == nil {
            return rootNode
        }
        return self.minNode(rootNode?.leftNode)
    }
    
    private func maxNode(_ rootNode: TreeNode?) -> TreeNode? {
        if rootNode?.rightNode == nil {
            return rootNode
        }
        return self.maxNode(rootNode?.rightNode)
    }
    
    private func successor(_ node: TreeNode?, val: Int) -> TreeNode? {
        guard let node = node else { return nil }
        
        if node.val == val {
            return self.minNode(node.rightNode)
        }
        else if node.val < val {
            return self.successor(node.rightNode, val: val)
        }
        else {
            let result = self.successor(node.leftNode, val: val)
            return result != nil ? result : node
        }
    }
    
    private func predecessor(_ node: TreeNode?, val: Int) -> TreeNode? {
        guard let node = node else { return nil }
        
        if node.val == val {
            return self.maxNode(node.leftNode)
        }
        else if node.val > val {
            return self.predecessor(node.leftNode, val: val)
        }
        else {
            let result = self.predecessor(node.rightNode, val: val)
            return result != nil ? result : node
        }
    }
    
    private func inorderTraversal(_ node: TreeNode?, sorted array: inout [Int]) {
        guard let node = node else {
            return
        }
        
        self.inorderTraversal(node.leftNode, sorted: &array)
        array.append(node.val)
        self.inorderTraversal(node.rightNode, sorted: &array)
    }
    
    private func inorderPrintHeight(_ node: TreeNode?, nodeHeights heightsMap: inout [Int:Int]) {
        guard let node = node else {
            return
        }
        self.inorderPrintHeight(node.leftNode, nodeHeights: &heightsMap)
#if DEBUG
        print("Node val: \(node.val) -> height: \(node.height)")
#endif
        heightsMap[node.val] = node.height
        self.inorderPrintHeight(node.rightNode, nodeHeights: &heightsMap)
    }
}
