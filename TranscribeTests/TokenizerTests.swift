import XCTest

class TokenizerTests: XCTestCase {
    
    func testTokenizeAsChars() throws {
        let tokens = Tokenizer.tokenizeAsChars("dog")
        XCTAssertEqual(tokens, ["d", "o", "g"])
    }
    
    func testTokenizeAsOddPairs() throws {
        let tokens = Tokenizer.tokenizeAsPairs("trochu", skipFirstLetter: false)
        XCTAssertEqual(tokens, ["tr", "oc", "hu"])
    }
    
    func testTokenizeAsEvenPairs() throws {
        let tokens = Tokenizer.tokenizeAsPairs("trochu", skipFirstLetter: true)
        XCTAssertEqual(tokens, ["t", "ro", "ch", "u"])
    }
    
    func testTokenizeAsWords() throws {
        let tokens = Tokenizer.tokenizeAsWords("Různé publikace a jiné zdroje informací používají všechny zmíněné názvy.")
        XCTAssertEqual(tokens, ["Různé", "publikace", "a", "jiné", "zdroje", "informací", "používají", "všechny", "zmíněné", "názvy"])
    }
    
}
