//
//  _7_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/30.
//

/**
 https://leetcode-cn.com/problems/reverse-integer/
 7.整数反转
 给你一个 32 位的有符号整数 x ，返回将 x 中的数字部分反转后的结果。
 如果反转后整数超过 32 位的有符号整数的范围 [−231,  231 − 1] ，就返回 0。
 */
/**
 输入：x = 123
 输出：321
 */

import Foundation

class Reverse_7 {
    // 取模运算是求两个数相除的余数
    // 需要考虑溢出问题
    // 假设有1147483649这个数字，它是小于最大的32位整数2147483647的，但是将这个数字反转过来后就变成了9463847411，这就比最大的32位整数还要大了，这样的数字是没法存到int里面的，所以肯定要返回0(溢出了)。
    
    func reverse(_ x: Int) -> Int {
        var res = 0
        var x = x
        while x != 0 {
            // 每次取未尾数字
            let tmp = x%10
            res = res*10 + tmp
            // 判断是否 大于 最大32位整数  判断是否 小于 最小32位整数
            if res > Int32.max || res < Int32.min {
                return 0
            }
            x = x / 10
        }
        return res
    }
}
