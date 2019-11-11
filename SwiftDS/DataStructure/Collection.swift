//
//  Collection.swift
//  SwiftDS
//
//  Created by Surendra Patel on 05/11/19.
//  Copyright © 2019 Crestron. All rights reserved.
//

import Foundation

protocol Collection {
    associatedtype T
    typealias Element = T
    func push(element data:Element) throws
    func pop() throws -> Element?
    func traverse() throws
    func insert(element data:Element, at index:UInt)
    func remove(at index:UInt)
    func removeLast()
    func removeFirst()
}

extension Collection {
    func insert(element data:Element, at index:UInt) {}
    func remove(at index:UInt) {}
    func removeLast() {}
    func removeFirst() {}
}
