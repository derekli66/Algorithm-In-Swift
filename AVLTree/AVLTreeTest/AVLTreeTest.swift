//
//  AVLTreeTest.swift
//  AVLTreeTest
//
//  Created by LEE CHIEN-MING on 2021/2/20.
//

import XCTest

class AVLTreeTest: XCTestCase {

    func testInsertion() throws {
        
        let avlTree = AVLTree()
        avlTree.insert(20)
        avlTree.insert(10)
        avlTree.insert(30)
        avlTree.insert(50)
        avlTree.insert(40)
        avlTree.insert(60)
        avlTree.insert(10)
        
        let expected = [10, 10, 20, 30, 40, 50, 60]
        XCTAssert(expected == avlTree.sort())
    }
    
    func testUpdateHeight() throws {
        let avlTree = AVLTree()
        avlTree.insert(20)
        avlTree.insert(10)
        avlTree.insert(30)
        
        let expected = [10:1, 20:2, 30:1]
        let heightsMap = avlTree.printHeight()
        XCTAssert(heightsMap == expected)
    }
    
    func testLeftRotation() throws {
        let avlTree = AVLTree()
        avlTree.insert(10)
        avlTree.insert(20)
        avlTree.insert(30)
        avlTree.insert(40)
        avlTree.insert(50)
        avlTree.insert(60)
        
        let expected = [10:1, 20:2, 30:1, 40:3, 50:2, 60:1]
        let heightsMap = avlTree.printHeight()
        XCTAssert(heightsMap == expected)
    }
    
    func testRightRotation() throws {
        let avlTree = AVLTree()
        avlTree.insert(60)
        avlTree.insert(50)
        avlTree.insert(40)
        avlTree.insert(30)
        avlTree.insert(20)
        avlTree.insert(10)
        
        let expected = [10:1, 20:2, 30:3, 40:1, 50:2, 60:1]
        let heightsMap = avlTree.printHeight()
        XCTAssert(heightsMap == expected)
    }
    
    func testDeletionAndRightRotation() throws {
        let avlTree = AVLTree()
        avlTree.insert(60)
        avlTree.insert(50)
        avlTree.insert(40)
        avlTree.insert(30)
        avlTree.insert(20)
        avlTree.insert(10)
        
        avlTree.remove(30)
        
        var expected = [10:1, 20:2, 40:3, 50:2, 60:1]
        var heightsMap = avlTree.printHeight()
        XCTAssert(expected == heightsMap)
        
        avlTree.remove(40)
        expected = [10:1, 20:2, 50:3, 60:1]
        heightsMap = avlTree.printHeight()
        XCTAssert(expected == heightsMap)
        
        avlTree.remove(50)
        expected = [10:1, 20:2, 60:1]
        heightsMap = avlTree.printHeight()
        XCTAssert(expected == heightsMap)
    }
    
    func testSuccessor() throws {
        let avlTree = AVLTree()
        avlTree.insert(60)
        avlTree.insert(50)
        avlTree.insert(40)
        avlTree.insert(30)
        avlTree.insert(20)
        avlTree.insert(10)
        
        var successor = avlTree.successor(10)
        XCTAssert(successor == 20)
        successor = avlTree.successor(20)
        XCTAssert(successor == 30)
        successor = avlTree.successor(30)
        XCTAssert(successor == 40)
        successor = avlTree.successor(40)
        XCTAssert(successor == 50)
        
        successor = avlTree.successor(5)
        XCTAssert(successor == 10)
        successor = avlTree.successor(15)
        XCTAssert(successor == 20)
        successor = avlTree.successor(25)
        XCTAssert(successor == 30)
        successor = avlTree.successor(35)
        XCTAssert(successor == 40)
        successor = avlTree.successor(45)
        XCTAssert(successor == 50)
        successor = avlTree.successor(55)
        XCTAssert(successor == 60)
        successor = avlTree.successor(65)
        XCTAssert(successor == nil)
    }
    
    func testPredecessor() throws {
        let avlTree = AVLTree()
        avlTree.insert(60)
        avlTree.insert(50)
        avlTree.insert(40)
        avlTree.insert(30)
        avlTree.insert(20)
        avlTree.insert(10)
        
        var predecessor = avlTree.predecessor(10)
        XCTAssert(predecessor == nil)
        predecessor = avlTree.predecessor(20)
        XCTAssert(predecessor == 10)
        predecessor = avlTree.predecessor(30)
        XCTAssert(predecessor == 20)
        predecessor = avlTree.predecessor(40)
        XCTAssert(predecessor == 30)
        
        predecessor = avlTree.predecessor(5)
        XCTAssert(predecessor == nil)
        predecessor = avlTree.predecessor(15)
        XCTAssert(predecessor == 10)
        predecessor = avlTree.predecessor(25)
        XCTAssert(predecessor == 20)
        predecessor = avlTree.predecessor(35)
        XCTAssert(predecessor == 30)
        predecessor = avlTree.predecessor(45)
        XCTAssert(predecessor == 40)
        predecessor = avlTree.predecessor(55)
        XCTAssert(predecessor == 50)
        predecessor = avlTree.predecessor(65)
        XCTAssert(predecessor == 60)
    }
    
    func testFindValueMethod() throws {
        let avlTree = AVLTree()
        avlTree.insert(60)
        avlTree.insert(50)
        avlTree.insert(40)

        XCTAssert(avlTree.findValue(60))
        XCTAssert(avlTree.findValue(50))
        XCTAssert(avlTree.findValue(40))
        XCTAssert(avlTree.findValue(30) == false)
        XCTAssert(avlTree.findValue(20) == false)
        XCTAssert(avlTree.findValue(10) == false)
    }
    
}
