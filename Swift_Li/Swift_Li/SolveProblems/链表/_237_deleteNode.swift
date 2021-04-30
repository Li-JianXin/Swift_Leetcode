//
//  _237_deleteNode.swift
//  leetcode
//
//  Created by 李建新 on 2021/4/11.
//

/**
 * 删除链表中的节点
 * https://leetcode-cn.com/problems/delete-node-in-a-linked-list/
 */

import Foundation

// 可选项是对其它类型的一层包装，类似一个盒子
// 如果为nil,它是一个空盒子，如果不为nil，那么盒子里装的是被包装类型的数据
// Int 和 Int? 不是同一个类型 Int? 是 Optional(Int)类型。所以这2个计算时，需要对Int?解包成Int类型
// 如果要从可选项中取出被包装的数据，需要使用感叹号！ 进行强制解包
// 对空盒子（值为nil）强制解包，会产生运行时错误

// 可选项解包
// 如果包含就自动解包，把值周一赋给let 或者 var，并返回true，否则返回false
// 例如
func test() {
    if let number = Int("123") {
        print("字符串转换整数成功：\(number)")
    } else {
        print("字符串转换整数失败")
    }
}

/*
class LinkList_DeleteNode_237 {
    func deleNode (_ node: ListNode?) {
        node?.val = (node?.next!.val)!
        node?.next = node?.next?.next
    }
}
*/
