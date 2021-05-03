//
//  ListNode.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/3.
//

import Foundation

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
