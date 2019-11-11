//
//  SDSGraph.swift
//  SwiftDS
//
//  Created by Surendra Patel on 31/10/19.
//  Copyright © 2019 Surendra Patel. All rights reserved.
//

import Foundation

class NodeList<T> where T: Comparable & Hashable {
    var  listHead:Node<T>
    
    init(with head:Node<T>) {
        self.listHead = head
    }
}

public class Graph<T> where T: Comparable & Hashable {
    
    private var verticesNodes:[T:NodeList<T>]
    
    init() {
        self.verticesNodes = [:]
    }
    
    public func addEdge(from source:T,to destination:T) {
        
        if self.verticesNodes.keys.contains(source) {
            //Add to existing list
            let list = self.verticesNodes[source]
            let newNode = Node(with: destination, inNext: list?.listHead)
            list?.listHead = newNode
        }
        else {
            //Add new list to vertices
            let nl:NodeList = NodeList<T>(with: Node<T>(with: destination, inNext: nil))
            self.verticesNodes[source] = nl
        }
    }
    
    public func traverse() {
        
        for key:T in self.verticesNodes.keys {
            var list:Node<T>? = self.verticesNodes[key]?.listHead
            var p:String = "Vertex \(key):"
            repeat {
                p.append(" > \(String(describing: list!.element))")
                list = list!.next
            } while (list != nil)
            print(p)
        }
    }
    
    func DFS() {
        //TODO
    }
    
    func BFS() {
        //TODO
    }
}
