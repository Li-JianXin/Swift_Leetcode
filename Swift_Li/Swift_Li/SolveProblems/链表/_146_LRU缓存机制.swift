//
//  _146_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/19.
//

/**
 https://leetcode-cn.com/problems/lru-cache/
 146. LRU 缓存机制
 */

import Foundation

class Node {  // 双向链表
    var pre: Node?
    var next: Node?
    var key: Int
    var value: Int
    
    init(_ key: Int, _ value: Int) {
        self.key = key
        self.value = value
    }
    init() {
        self.key = 0
        self.value = 0
    }
}

class LRUCache {
    var map: [Int: Node] = [:]
    var capacity: Int
    // 虚拟头节点
    var first: Node?
    // 虚拟尾节点
    var last: Node?
    
    init(_ capacity: Int) {
        self.capacity = capacity
        first = Node()
        last = Node()
        first?.next = last
        last?.pre = first
    }
    
    func get(_ key: Int) -> Int {
        if let node = map[key] {
            moveToFirst(node)
            return node.value
        } else {
            return -1
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = map[key] {
            node.value = value
            // 将最新的数据插入头节点和之前的最新节点之间
            moveToFirst(node)
        } else {
            let newNode = Node(key, value)
            if map.keys.count == self.capacity {
                // 满了 删除最近最少使用的节点
                let leastNode = last?.pre
                removeNode(leastNode!)
                map.removeValue(forKey: leastNode!.key)
                
            }
            map[key] = newNode
            insertFirst(newNode)
        }
    }
    
    // 删除节点
    func removeNode(_ node: Node) {
        node.pre?.next = node.next
        node.next?.pre = node.pre
        node.pre = nil
        node.next = nil
    }
    // 将一个节点插入到最前面
    func insertFirst(_ node: Node) {
        // 取出之前的最新节点
        node.pre = first
        node.next = first?.next
        first?.next?.pre = node
        first?.next = node
    }
    // 移动到前边
    func moveToFirst(_ node: Node) {
        removeNode(node)
        insertFirst(node)
    }
}
