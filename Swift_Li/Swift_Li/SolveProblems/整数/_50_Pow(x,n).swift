//
//  _50_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/7.
//

/**
 https://leetcode-cn.com/problems/powx-n/
 实现 pow(x, n) ，即计算 x 的 n 次幂函数（即，xn）。
 */

import Foundation

class Pow_50_Solution {
    /**
     求x的n次方，如果一个个乘下去，时间复杂度O(n)。
     采用分治思路，如x^20 = x^10 * x^10  x^10 = x^5 * x^5。可以把时间复杂度将为O(logn)
     */
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }
        if n == -1 {
            return 1 / x
        }
        // 是否为奇数 奇数用2进制表示，最后一位肯定是1，与1进行按位与运算，同为1，结果则是1，其它为都是0
        /**
         如：5和1按位与运算
         0101  (5)
         0001  (1)  &
       = 0001  (1)
         6和1按位与运算
         0110   (6)
         0001   (1) &
       = 0000   (0)
         */
        let isOdd = (n & 1) == 1
        var half = myPow(x, n >> 1)
        half *= half
        return isOdd ? (half * x) : half
    }
}
