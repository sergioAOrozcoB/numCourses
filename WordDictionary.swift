import UIKit

struct WordDictionary {
    private var dic:[String: String] = [:]
    
    mutating func addWord(_ word: String) {
        dic[word] = word.lowercased()
    }
    
    func search(_ word: String) -> Bool {
        if let _ = dic[word.lowercased()] {
            return true
        }
        
        for (key, string) in dic {
            if isSame(word, key) {
                return true
            }
        }
        
        return false
    }
    
    func isSame(_ searched: String, _ dictVal: String) -> Bool {
        if searched.count != dictVal.count {
            return false
        }
        
        var firstArray = Array(searched)
        var secondArray = Array(dictVal)
        var count = 0
        
        for i in 0..<firstArray.count {
            if firstArray[i] == secondArray[i] {
                count += 1
            } else if "\(firstArray[i])" == "." {
                count += 1
            }
        }
        
        
        return count == searched.count
    }
}

var dict = WordDictionary()
dict.addWord("bad");
dict.addWord("dad");
dict.addWord("mad");

dict.search("pad"); // return False
dict.search("bad"); // return True
dict.search(".ad"); // return True
dict.search("b.."); // return True


