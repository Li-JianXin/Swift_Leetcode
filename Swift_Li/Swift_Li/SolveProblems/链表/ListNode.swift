//
//  ListNode.swift
//  leetcode
//
//  Created by 李建新 on 2021/4/11.
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
