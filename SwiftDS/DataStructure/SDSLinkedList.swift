//
//  SDSLinkedList.swift
//  SwiftDS
//
//  Created by Surendra Patel on 04/11/19.
//  Copyright © 2019 Surendra Patel. All rights reserved.
//

import Foundation

public enum NodeLocation {
    case FRONT
    case END
}

enum DSError: Error {
    case error(description:String)
    
    init(description message:String) {
        self = .error(description: message)
    }
}

public class LinkedList<L> where L: Comparable {    
    var start:Node<L>?
    
    init(with node:Node<L>? = nil) {
        self.start = node
    }
    
    public func addNode(with element:L, at location:NodeLocation = .FRONT) -> Void {
        
        let node:Node<L> = createNode(with: element)
        
        guard let _ = start else {
            self.start = node
            return
        }
        
        switch location {
            case .FRONT:
                node.next = start
                start = node
                
            break
                
            case .END:
                let lastNode:Node<L>? = getLastNode()
                lastNode?.next = node
                
            break
        }
    }
    
    public func removeNode(at location:NodeLocation = .FRONT) -> L? {
        var removedNode:Node<L>? = nil
        
        switch location {
            case .FRONT:
                guard let _ = start else {
                    return removedNode?.element
                }
                removedNode = start
                start = removedNode?.next
            break
                
            case .END:
                guard var secondLastNode:Node<L> = self.start else {
                    return nil
                }
                var previous:Node<L>? = secondLastNode.next
                
                guard let _ = previous else {
                    //Only have one node i.e. start node
                    start = nil
                    return secondLastNode.element
                }
                
                while secondLastNode.next != nil {
                    previous = secondLastNode
                    secondLastNode = secondLastNode.next!
                }
                removedNode = previous?.next
                previous?.next = nil
            break
        }
        return removedNode?.element
    }
    
    public func addNode(_ data:L, at index:UInt) throws -> Void {
        let newNode:Node = createNode(with: data)
        var count:UInt = 0
        
        guard let _ = self.start else {
            throw DSError(description: "Index(\(index)) is out of bound")
        }
        if index == 0 {
            newNode.next = self.start
            self.start = newNode
            return
        }
        var tempNode:Node? = self.start
        while tempNode != nil {
            if count == index - 1 {
                newNode.next = tempNode?.next
                tempNode?.next = newNode
                return
            }
            count += 1
            tempNode = tempNode?.next
        }
        throw DSError(description: "Index(\(index)) is out of bound")
    }
    
    public func removeNode(at index:UInt) throws -> L? {
        var count:UInt = 0
                
        var node:Node<L>? = self.start
        var previous:Node<L>? = nil
        while count < index && node != nil {
            count += 1
            previous = node
            node = node?.next
        }
        if previous == nil {
            self.start = node?.next
            return node?.element
        }
        else if count == index && node != nil {
            previous?.next = node?.next
            return node?.element
        }
        else {
            throw DSError(description: "No Node Found for Index(\(index))")
        }
    }
    
    public func traverse() {
        var localStart = self.start
        while localStart != nil {
            print(localStart!.element)
            localStart = localStart?.next
        }
    }
    
    public func isEmpty() -> Bool {
        guard let _ = start else { return true }
        return false
    }
    
    public func count() -> UInt {
        var count:UInt = 0
        var lastNode = self.start
        while lastNode != nil {
            count += 1
            lastNode = lastNode?.next
        }
        return count
    }
    
    private func createNode(with data:L) -> Node<L> {
        return Node(with: data)
    }
    
    private func getLastNode() -> Node<L>? {
        guard var lastNode:Node<L> = self.start else {
            return nil
        }
        
        while lastNode.next != nil {
            lastNode = lastNode.next!
        }
        return lastNode
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let next = self.start else {
            return "LinkList is Empty"
        }
        return String(describing: next)
    }
}
