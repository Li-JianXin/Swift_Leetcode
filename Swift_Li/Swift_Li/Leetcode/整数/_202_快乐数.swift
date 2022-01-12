//
//  _202.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/6/8.
//

/**
 202. 快乐数
 https://leetcode-cn.com/problems/happy-number/
 
 编写一个算法来判断一个数 n 是不是快乐数。

 「快乐数」定义为：

 对于一个正整数，每一次将该数替换为它每个位置上的数字的平方和。
 然后重复这个过程直到这个数变为 1，也可能是 无限循环 但始终变不到 1。
 如果 可以变为  1，那么这个数就是快乐数。
 如果 n 是快乐数就返回 true ；不是，则返回 false 。
 
 输入：n = 19
 输出：true
 解释：
 1^2 + 9^2 = 82
 8^2 + 2^2 = 68
 6^2 + 8^2 = 100
 1^2 + 0^2 + 0^2 = 1
 */

import Foundation

class Solution_202 {
    // 双指针法 检测是否有循环，有循环时检测循环的值是否为1
    // 不快乐数不能变成1 会一直循环下去
    // 快慢指针相遇时，就是一次循环，判断是不是由1引起的循环，是则是快乐数
    func isHappy(_ n: Int) -> Bool {
        var n = n
        var slow = n
        var fast = getNext(&n)
        while fast != 1 && slow != fast {
            slow = getNext(&slow)
            // 要传入可变值
            var fastTmp = getNext(&fast)
            fast = getNext(&fastTmp)
        }
        return fast == 1
    }
    
    func getNext(_ n: inout Int) -> Int {
        var total = 0
        while n > 0 {
            // d是个位的值
            let d = n % 10
            // n是除10的数
            n = n / 10
            total += d * d
        }
        return total
    }
}
