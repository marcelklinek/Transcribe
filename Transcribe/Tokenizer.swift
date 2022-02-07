import Foundation

public class Tokenizer {

    static func asSentences(_ input: String) -> [String] {
        let sentences = input.split(omittingEmptySubsequences: true, whereSeparator: { ["?", "!", ".", ";"].contains($0) })
        let result = sentences.map{ $0.trimmingCharacters(in: .whitespacesAndNewlines) }
        return result
    }
    
    static func asWords(_ input: String) -> [String] {
        let words = input.split(separator: " ")
        let result = words.map{ $0.trimmingCharacters(in: .punctuationCharacters) }
        return result
    }
    
    static func asPairs(_ input: String, skipFirstLetter: Bool) -> [String] {
        var str = String(input)
        if skipFirstLetter {
            let first = str.removeFirst()
            var pairs = str.components(withMaxLength: 2)
            pairs.insert(String(first), at: 0)
            return pairs
            
        }
        return str.components(withMaxLength: 2)
    }
    
    static func asChars(_ input: String) -> [Character] {
        return Array(input)
    }
}

extension String {
    func components(withMaxLength length: Int) -> [String] {
        return stride(from: 0, to: self.count, by: length).map {
            let start = self.index(self.startIndex, offsetBy: $0)
            let end = self.index(start, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            return String(self[start..<end])
        }
    }
}
