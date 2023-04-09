import UIKit


// MARK: - Problem Statement

// Reverse word of a given sentance if it has more than 4 characters

// MARK: - Solution Approach steps

// separate words from sentance
// check word has more than 4 characters
// reverse the word which has more than 5 characters
// add all words from the array to make sentance

// MARK: - Solution Pseudocode

func reverseStringHavingCharactersMoreThanFour(_ str: String) -> String {
    var words: [String] = []
    var finalString: String = ""
    
    words = str.components(separatedBy: " ")
    
    for i in 0..<words.count {
        let word = words[i]
        
        if word.count > 4 {
            var reversedWord = ""
            for j in word {
                reversedWord.insert(j, at: reversedWord.startIndex)
            }
            words.remove(at: i)
            words.insert(reversedWord, at: i)
        }
        
        finalString += words[i]
        finalString += " "
    }
    return finalString
}

var greeting = "Hello Gaganjot, How are you?"

print(reverseStringHavingCharactersMoreThanFour(greeting))
// this approach has -- --
// space complexity = O(1)
// time complexity = O(n^2)
