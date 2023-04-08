import UIKit

var greeting = "Hello, playground"

// given number is armstrong or not?

// 153 == 1^3 + 5^3 + 3^3
// so this is an armstrong number

// steps:
// count number of digits first
// get digit of each place and make multiply itself with respect to number of count
// add result of each place digit

func checkForArmstrongNumber(_ num: Int) -> Bool {
    var count = 0
    var sum = 0
    var currentRemainingNumberDigit = num
    
    while currentRemainingNumberDigit != 0 {
        currentRemainingNumberDigit = currentRemainingNumberDigit / 10
        count += 1
    }
    
    currentRemainingNumberDigit = num
    
    while currentRemainingNumberDigit != 0 {
        let rem = currentRemainingNumberDigit % 10
        let digitToThePowerCount = pow(Double(rem), Double(count))
        sum += Int(digitToThePowerCount)
        currentRemainingNumberDigit = currentRemainingNumberDigit / 10
    }
    
    return sum == num
}

print(checkForArmstrongNumber(153))
