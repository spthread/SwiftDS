//
//  SDSStack.swift
//  SwiftDS
//
//  Created by Surendra Patel on 31/10/19.
//  Copyright © 2019 Surendra Patel. All rights reserved.
//

import Foundation

public class Stack<T>: Collection where T: Comparable {
    var topNode:Node<T>?
    
    init(with value:T) {
        self.push(element: value)
    }
    
    public func push(element data:T) {
        let node = Node(with: data, inNext: nil)
        guard let _ = self.topNode else {
            self.topNode = node
            return
        }
        node.next = self.topNode
        self.topNode = node
    }
    
    public func pop() throws -> T? {
        guard let node = self.topNode else {
            throw DSError(description: "Stack is empty")
        }
        self.topNode = node.next
        return node.element
    }
    
    public func top() throws -> T? {
        guard let node = self.topNode else {
            throw DSError(description: "Stack is empty")
        }
        return node.element
    }
    
    public func traverse() throws -> Void {
        guard let _ = self.topNode else {
            throw DSError(description: "Stack is empty")
        }
        print("--------------Traverse--------------")
        var tempNode:Node? = self.topNode
        while tempNode != nil {
            print(tempNode?.element ?? "No Data")
            tempNode = tempNode?.next
        }
        print("--------------Traversed--------------")
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        guard let next = self.topNode else {
            return "LinkList is Empty"
        }
        return String(describing: next)
    }
}
