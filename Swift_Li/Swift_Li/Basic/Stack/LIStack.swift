//
//  LiStack.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/12.
//

import Foundation

/**
 结构体和类相同点
 都可以
 定义属性用于存储值
 定义方法用于提供功能
 定义下标操作用于通过下标语法访问它们的值
 定义构造器用于设置初始值
 通过扩展以增加默认实现之外的功能
 遵循协议以提供某种标准功能
 */
/**
 和结构体比，类的附加功能
 继承允许一个类继承另一个类的特征
 类型转换允许在运行时检查和解释一个类实例的类型
 析构器允许一个类实例释放任何其所被分配的资源
 引用计数允许对一个类的多次引用
 */

// FILO
struct LIStack<T> {
    var ary = [T]()
    var first: T?  // 可选类型 可能为空，如空数组
    var last: T?
    init() {
        first = nil
    }
    mutating func push(_ element: T) {
        ary.append(element)
        if ary.count == 1 {
            first = element
            last = element
        } else {
            last = element
        }
    }
    mutating func push(_ element: T, at idx: Int) {
        if idx > ary.count {
            // 最多插入到最后一个，数组元素地址是连续的
            let string = "索引\(idx) 不合法，最大允许索引\(ary.count)"
            print(string)
            return
        }
        if idx < 0 {
            print("idx 不能小于0")
            return
        }
        ary.insert(element, at: idx)
    }
    mutating func remove(at idx: Int) -> [T] {
        if idx > ary.count || idx < 0 {
            print("无效索引")
            return ary
        }
        ary.remove(at: idx)
        if ary.count == 0 {
            first = nil
            last = nil
        } else {
            last = ary.last
        }
        return ary
    }
    mutating func pop() -> T {
        return ary.removeLast()
    }
}
