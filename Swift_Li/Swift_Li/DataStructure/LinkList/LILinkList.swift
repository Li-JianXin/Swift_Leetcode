//
//  LILinkList.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/12.
//

import Foundation

public protocol ListProtocol {
    // protocol不支持直接使用泛型,可以使用 associatedType 关联类型
    associatedtype T: Equatable;
    // 清除所有元素
    func clear()
    // 元素长度
    var length: Int { get }  // 标记可读 如果可写的话  { get set }
    // 是否为空
    var isEmpty: Bool { get }
    // 是否包含某个元素
    func contains(_ element: T) -> Bool
    // 添加元素到尾部
    func add(_ element: T)
    // 获取index位置的元素
    func get(_ index: Int) -> T?
    // 设置index位置的值
    func set(_ element: T, at index: Int)
    // 删除index位置的元素
    func remove(_ index: Int) -> T?
    // 查看元素索引
    func indexOf(_ element: T) -> Int
}


class LILinkNode<T: Equatable> {
    var value: T
    var next: LILinkNode?
    init(_ value: T) {
        self.value = value
    }
}

// 提示 Class "LILinkList" has no initializers
// 在类中声明的可选类型 如first last被自动初始化为nil
class LILinkList<T: Equatable>: NSObject, ListProtocol {
    
    var length: Int
    // any 表示任何类型的实例
    var first: LILinkNode<T>?
    var last: LILinkNode<T>?
    
    override init() {
        length = 0
    }
    
    
    // MARK: - ListProtocol
    typealias T = T

    func clear() {
        length = 0
        first = nil
        last = nil
    }
    
    var isEmpty: Bool {
        if length == 0 {
            return true
        }
        return false
    }
    
    func contains(_ element: T) -> Bool {
        return false
    }
    
    // 通过索引获取结点
    private func node(_ index: Int) -> LILinkNode<T>? {
        // 从首结点开始
        var node = first
        for i in 0..<length {
            node = node?.next
            if i == index {
                return node!
            }
        }
        return nil
    }
    
    func add(_ element: T) {
        let node = LILinkNode(element)
        if length == 0 {
            // 首结点
            node.next = nil
            first = node
            last = node
        } else {
            // 默认加到尾结点
            last?.next = node
            node.next = nil
            last = node
        }
        length += 1
    }
    
    func get(_ index: Int) -> T? {
        let _node = node(index)
        return _node?.value
    }
    
    func set(_ element: T, at index: Int) {
        // 原索引位置的node
        let oldNode = node(index)
        oldNode?.value = element
    }
    
    func remove(_ index: Int) -> T? {
        let _nodel = node(index)
        let prev = node(index-1)
        prev?.next = prev?.next?.next
        length -= 1
        return _nodel?.value
    }
    
    func indexOf(_ element: T) -> Int {
        var node = first
        for i in 0..<length {
            if node?.value == element {
                return i
            }
            node = node?.next
        }
        return -1
    }
    
}


