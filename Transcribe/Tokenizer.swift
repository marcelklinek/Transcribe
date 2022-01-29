public class Tokenizer {

    static func tokenizeAsWords(_ input: String) -> [Substring] {
        var str = String(input).trimmingCharacters(in: .punctuationCharacters)
        return str.split(separator: " ")
    }
    
    static func tokenizeAsPairs(_ input: String, skipFirstLetter: Bool) -> [String] {
        var str = String(input)
        if skipFirstLetter {
            let first = str.removeFirst()
            var pairs = str.components(withMaxLength: 2)
            pairs.insert(String(first), at: 0)
            return pairs
            
        }
        return str.components(withMaxLength: 2)
    }
    
    static func tokenizeAsChars(_ input: String) -> [Character] {
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