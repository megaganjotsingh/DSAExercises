import UIKit
 
// find Max Sub Array Sum

// brute force using three nested loops
func findMaxSubArraySum(_ arr: [Int]) -> ([Int], Int) {
    var maxSubArraySum = 0
    var maxSubArray: [Int] = []
    
    for i in 0..<arr.endIndex {
        for j in i..<arr.endIndex {
            var subArraySum = 0
            var subArray = [Int]()
            for k in i...j {
                subArraySum += arr[k]
                subArray.append(arr[k])
            }
            if subArraySum > maxSubArraySum {
                maxSubArraySum = subArraySum
                maxSubArray = subArray
            }
        }
    }
    return (maxSubArray, maxSubArraySum)
}

// time complexity = O(n*n*n)
// space complexity = O(1)

print(findMaxSubArraySum([-3, 2, -1, 4, -2]))

print(findMaxSubArraySum([-4, 5, 7, -6, 10, -15, 3]))


// using two nested loops

func findMaxSubArraySum2(_ arr: [Int]) -> ([Int], Int) {
    var maxSubArray: [Int] = []
    var maxSubArraySum: Int = 0
    
    for i in 0..<arr.endIndex {
        var subArr = [Int]()
        var subArrSum = 0
        for j in i..<arr.count {
            let element = arr[j]
            subArr.append(element)
            subArrSum += element
            if subArrSum > maxSubArraySum {
                maxSubArray = subArr
                maxSubArraySum = subArrSum
            }
        }
    }
    return (maxSubArray, maxSubArraySum)
}

print("using two nested loops")
print(findMaxSubArraySum2([-3, 2, -1, 4, -2]))

print(findMaxSubArraySum2([-4, 5, 7, -6, 10, -15, 3]))

// time complexity = O(n*n)
// space complexity = O(1)

// BY USING DYNAMIC PROGRAMMING

func findMaxSubArrSumUsingDP(_ arr: [Int]) -> Int {
    var maxSumEnding: [Int] = Array(repeating: 0, count: arr.count)
    maxSumEnding[0] = arr[0]
    
    for i in 1..<arr.count {
        if maxSumEnding[i-1] > 0 {
            maxSumEnding[i] = arr[i] + maxSumEnding[i-1]
        } else {
            maxSumEnding[i] = arr[i]
        }
    }
    
    var maxSum: Int = .min
    for j in maxSumEnding {
        maxSum = max(j, maxSum)
    }
    
    return maxSum
}

// time complexity = O(n)
// space complexity = O(n)

print("findMaxSubArrSumUsingDP")
print(findMaxSubArrSumUsingDP([-3, 2, -1, 4, -2]))

print(findMaxSubArrSumUsingDP([-4, 5, 7, -6, 10, -15, 3]))


// BY USING KADANE'S ALGORITHM

func findMaxSubArrayUsingKadaneAlgo(_ arr: [Int]) -> Int {
    var maxSumSoFar = 0
    var maxSumEndingHere = 0
    
    for i in 0..<arr.count {
        maxSumEndingHere = max(maxSumEndingHere + arr[i], arr[i])
        
        if maxSumEndingHere > maxSumSoFar {
            maxSumSoFar = maxSumEndingHere
        }
    }
    
    return maxSumSoFar
}

// time complexity = O(n)
// space complexity = O(1)

print("findMaxSubArrayUsingKadaneAlgo")
print(findMaxSubArrayUsingKadaneAlgo([-3, 2, -1, 4, -2]))

print(findMaxSubArrayUsingKadaneAlgo([-4, 5, 7, -6, 10, -15, 3]))
