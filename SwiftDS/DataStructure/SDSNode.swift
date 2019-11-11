//
//  SDSNode.swift
//  SwiftDS
//
//  Created by Surendra Patel on 05/11/19.
//  Copyright © 2019 Crestron. All rights reserved.
//

import Foundation

class Node<T> where T: Comparable {
    var element:T
    var next:Node?
    
    init(with element:T, inNext:Node? = nil) {
        self.element = element
        self.next = inNext
    }
}

extension Node: CustomStringConvertible {
    
    public var description: String {
        guard let next = next else {
            return "\(element)"
        }
        return "\(element) > " + String(describing: next)
    }
}
