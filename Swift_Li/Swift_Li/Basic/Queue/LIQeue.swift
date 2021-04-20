//
//  LIQeue.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/12.
//

import Foundation

// FIFO
class LIQueue: NSObject {
    //类和结构体在创建实例时，必须为所有存储型属性设置合适的初始值。存储型属性的值不能处于一个未知的状态
    // ary这个属性在声明时就成了初始化，相当于进行了赋值
    var ary = [Int]()
    var count: Int {
        return ary.count
    }
    var first: Int? {
        return ary.first
    }
    var last: Int? {
        return ary.last
    }
    // 构造器
    override init() {
        
    }
    // 自定义构造器
    init(queuOriginalArray array: [Int]) {
        ary = array
    }
    
    func push(_ element: Int) {
        ary.append(element)
    }
    func pop() -> Int {
        return ary.removeFirst()
    }
    func inset(_ element: Int, _ idx: Int) {
        if idx > ary.count {
            // 最多插入到最后一个，数组元素是连续的
            let string = "索引\(idx) 不合法，最大允许索引\(ary.count)"
            print(string)
            return
        }
        if idx < 0 {
            print("idx 不能小于0")
            return
        }
        ary.insert(element, at: idx)
        print("数据插入成功")
    }
    
    override var description: String {
        return ary.description
    }
}
