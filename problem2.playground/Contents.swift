import UIKit

// MARK: - Problem Statement

// finding the sum of all integers from 1 to n

// MARK: - Steps
//Pre-condition: We need to define two variables: a variable i that acts as a loop counter and a variable sum to store the sum of all integers. We want to do a sum from 1 to n, so at the start, we initialize sum = 0 and i = 1.
//
//Post-condition: After the loop termination, the value of the sum must be equal to the sum of all integers from 1 to n.
//
//Loop variant: The loop should terminate after the addition of all integers from 1 to n ,i.e, i <= n. In other words, loop should not terminate until we have added n to the sum.
//
//Loop invariant: We need to set the loop invariant to ensure correct output after the loop termination. As discussed above, the loop invariant must be true before and after each iteration.

// MARK: - Solution Pseudocode

func findSumOfNaturalNumbers(upto num: Int) -> Int {
    var sum = 0
    var i = 1
    while i <= num {
        sum += i
        i += 1
    }
    return sum
}

print(findSumOfNaturalNumbers(upto: 10))

// MARK: - Solution Pseudocode with recursion

func findSumThroughRecursion(upto num: Int) -> Int {
    if num <= 0 {
        return 0
    }
    return num + findSumThroughRecursion(upto: num - 1)
}

print(findSumThroughRecursion(upto: 100))
