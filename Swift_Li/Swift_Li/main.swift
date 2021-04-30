//
//  main.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/12.
//

import Foundation

print("Hello, World!")

//var array = [1,2,3,4,5]
//let mx65 = MaxProfit_65()
//let a = mx65.maxProfit1(array)
//print(a)


var array = [1,5,3,7,3]
let sort = Sort()
sort.countingSort(&array)
print(array)
