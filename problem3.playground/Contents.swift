import UIKit

// MARK: - Problem Statement

// Finding the max element in an array

// MARK: - Steps for Solution

//Pre-condition: we need to define two variables: a loop variable i that acts as a loop counter and a variable max to store the maximum of all integers. Before starting the loop to find the max value from X[0] to X[n-1], we initialize max = X[0] and start the loop from i = 1. This pre-condition is true when we enter the first iteration of loop.
//
//Post-condition: After loop termination, the max value must store the maximum of all values from X[0] to X[n - 1].
//
//Loop variant: The loop must terminate after finding the max of all integers from X[0] to X[n-1]. In other words, the loop should not terminate until we have compared X[n - 1] to the max i.e. i <= n - 1 or i < n.
//
//Loop invariant: Let's assume invariant is true after (i - 1)th iteration, i.e., max stores the maximum of all integers from X[0] to X[i-1]. We need to design instruction so that the invariant must be true after ith iterations of the loop i.e. max must be equal to the max of all integers from X[0] to X[i]. Here are the steps of the ith iteration:
//
//We compare max with new value X[i]. If (max < X[i]), it means we have found a value that is greater than the max of all values from X[0] to X[i - 1]. In such a situation, we update the max value with X[i] i.e. max = X[i]. Otherwise, we ignore it, and value stored in max is still the maximum of all integers from X[0] to X[i].
//We also increase i by 1 at each iteration to update the maximum from X[0] to X[n - 1] in max.

// MARK: - Solution Pseodocode
func findMax(fromArray arr: [Int]) -> Int {
    var max = arr[0]
    var i = 0
    while i < arr.endIndex {
        if max < arr[i] {
            max = arr[i]
        }
        i += 1
    }
    return max
}

print(findMax(fromArray: [4, 7, 1, 9, 3, 2, 5, 2, 3, 8]))
