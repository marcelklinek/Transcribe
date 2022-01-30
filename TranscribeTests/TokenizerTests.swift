import XCTest

class TokenizerTests: XCTestCase {
    
    func testTokenizeAsSentences() throws {
        let tokens = Tokenizer.tokenizeAsSentences("Mojí největší touhou bylo sebrat se a hned ráno vypadnout z města. Ale když zařinčel budík, bylo jedenáct, když jsem dopíjel kafe, bylo půl třetí, a když zazvonil Pavlik, byly čtyři. Podle toho, jak světlo dopadalo na závěs v pokoji, musel být venku nádherný den. Vypil jsem s Pavlikem ještě jednoho turka a vyšli jsme na ulici.")
        XCTAssertEqual(tokens, [
            "Mojí největší touhou bylo sebrat se a hned ráno vypadnout z města",
            "Ale když zařinčel budík, bylo jedenáct, když jsem dopíjel kafe, bylo půl třetí, a když zazvonil Pavlik, byly čtyři",
            "Podle toho, jak světlo dopadalo na závěs v pokoji, musel být venku nádherný den",
            "Vypil jsem s Pavlikem ještě jednoho turka a vyšli jsme na ulici"
        ])
    }
    
    func testTokenizeAsSentencesExclamation() throws {
        let tokens = Tokenizer.tokenizeAsSentences("To se rozumí, řekl si, vždyť to, co ten jasnovidec říkal, se může hodit na každého druhého! To jsou jen takové obecnosti.")
        XCTAssertEqual(tokens, [
            "To se rozumí, řekl si, vždyť to, co ten jasnovidec říkal, se může hodit na každého druhého",
            "To jsou jen takové obecnosti"
        ])
    }
    
    func testTokenizeAsWords() throws {
        let tokens = Tokenizer.tokenizeAsWords("Různé publikace a jiné zdroje informací používají všechny zmíněné názvy.")
        XCTAssertEqual(tokens, ["Různé", "publikace", "a", "jiné", "zdroje", "informací", "používají", "všechny", "zmíněné", "názvy"])
    }
    
    func testTokenizeAsOddPairs() throws {
        let tokens = Tokenizer.tokenizeAsPairs("trochu", skipFirstLetter: false)
        XCTAssertEqual(tokens, ["tr", "oc", "hu"])
    }
    
    func testTokenizeAsEvenPairs() throws {
        let tokens = Tokenizer.tokenizeAsPairs("trochu", skipFirstLetter: true)
        XCTAssertEqual(tokens, ["t", "ro", "ch", "u"])
    }

    func testTokenizeAsChars() throws {
        let tokens = Tokenizer.tokenizeAsChars("dog")
        XCTAssertEqual(tokens, ["d", "o", "g"])
    }
}
