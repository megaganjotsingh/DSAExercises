import UIKit

// merge sort-- divide and conquer

func mergeSort(_ list: [Int]) -> [Int] {
    guard list.count > 1 else {
        return list
    }
    
    let leftList = Array(list[0..<list.count/2])
    let rightList = Array(list[list.count/2..<list.count])
    
    return merge(left: mergeSort(leftList), right: mergeSort(rightList))
}

func merge(left: [Int], right: [Int]) -> [Int] {
    var mergedList = [Int]()
    var left = left
    var right = right
    
    while left.count > 0 && right.count > 0 {
        if left.first! < right.first! {
            mergedList.append(left.removeFirst())
        } else {
            mergedList.append(right.removeFirst())
        }
    }
    return mergedList + left + right
}

var list = [Int]()

for _ in 0..<1000 {
    list.append(Int(arc4random_uniform(UInt32(10000))))
}

print(list)

print()

print(mergeSort(list))
