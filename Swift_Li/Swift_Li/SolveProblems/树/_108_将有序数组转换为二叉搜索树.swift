//
//  _108_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/6/7.
//

/**
 108. 将有序数组转换为二叉搜索树
 https://leetcode-cn.com/problems/convert-sorted-array-to-binary-search-tree/

 给你一个整数数组 nums ，其中元素已经按 升序 排列，请你将其转换为一棵 高度平衡 二叉搜索树。
 高度平衡 二叉树是一棵满足「每个节点的左右两个子树的高度差的绝对值不超过 1 」的二叉树。
 */

import Foundation

class Solution_108 {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return dfs(nums, 0, nums.count - 1)
    }

    func dfs(_ nums: [Int], _ l: Int, _ r: Int) -> TreeNode? {
        if l > r {
            return nil
        }
        // 以升序数组的中间元素作为根节点 root
        let mid = l + (r - l) / 2
        let root = TreeNode(nums[mid])
        // 递归构建root的左子树和右子树
        root.left = dfs(nums, l, mid-1)
        root.right = dfs(nums, mid+1, r)
        return root
    }
}
