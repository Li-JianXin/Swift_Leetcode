//
//  _654_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/6.
//

/**
 https://leetcode-cn.com/problems/maximum-binary-tree/
 654. 最大二叉树
 给定一个不含重复元素的整数数组 nums 。一个以此数组直接递归构建的 最大二叉树 定义如下：
 1. 二叉树的根是数组 nums 中的最大元素。
 2. 左子树是通过数组中 最大值左边部分 递归构造出的最大二叉树。
 3. 右子树是通过数组中 最大值右边部分 递归构造出的最大二叉树。
 返回有给定数组 nums 构建的 最大二叉树 。
 */

import Foundation
/**
 题目理解：每次寻找数组中的最大值做为根节点，最大值左边的数组做为左子树，最大值右边数组做为右子树
 从左子树的数组中再次找最大值做左子树根节点，一直递归下去
 */
class Tree_654_Solution {
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        return findMaxNode(nums, 0, nums.count)
    }
    // 找出l r之间的的根节点
    func findMaxNode(_ nums: [Int], _ l: Int, _ r: Int) -> TreeNode? {
        if l == r {
            return nil
        }
        // 最大值索引
        var maxIdx = l
        for i in l+1..<r {
            if nums[i] > nums[maxIdx] {
                maxIdx = i // 找出最大索引值
            }
        }
        let node = TreeNode(nums[maxIdx])  // 根结点
        node.left = findMaxNode(nums, l, maxIdx)
        node.right = findMaxNode(nums, maxIdx+1, r)
        return node
    }
}
