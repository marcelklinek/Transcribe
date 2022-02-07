import XCTest

class WordTranscriberTests: XCTestCase {
    
    var transcriber: WordTranscriber!
    
    override func setUp() {
        transcriber = WordTranscriber()
    }
    
    override func tearDown() {
        transcriber = nil
    }
    
    func testTransribeAlong() throws {
        let transcription = transcriber.transcribe("pán")
        XCTAssertEqual(transcription, "pa:n")
    }
    
    func testTransribeElong() throws {
        let transcription = transcriber.transcribe("fén")
        XCTAssertEqual(transcription, "fe:n")
    }
    
    func testTransribeIlong() throws {
        let transcription = transcriber.transcribe("mír")
        XCTAssertEqual(transcription, "mi:r")
    }
    func testTransribeOlong() throws {
        let transcription = transcriber.transcribe("gól")
        XCTAssertEqual(transcription, "go:l")
    }
    
    func testTransribeUlong() throws {
        let transcription = transcriber.transcribe("úbk")
        XCTAssertEqual(transcription, "u:bk")
    }
    
    func testTransribeUring() throws {
        let transcription = transcriber.transcribe("důl")
        XCTAssertEqual(transcription, "du:l")
    }
    
    func testTransribeEcaron() throws {
        let transcription = transcriber.transcribe("květ")
        XCTAssertEqual(transcription, "kvjet")
    }
    
    func testTransribeDecaron() throws {
        let transcription = transcriber.transcribe("děd")
        XCTAssertEqual(transcription, "ďed")
    }
    
    func testTransribeDecaronCapital() throws {
        let transcription = transcriber.transcribe("Vševěd")
        XCTAssertEqual(transcription, "vševjed")
    }
    
    func testTransribeTecaron() throws {
        let transcription = transcriber.transcribe("kutě")
        XCTAssertEqual(transcription, "kuťe")
    }
    
    func testTransribeNecaron() throws {
        let transcription = transcriber.transcribe("něco")
        XCTAssertEqual(transcription, "ňeco")
    }
    
    func testTransribeDi() throws {
        let transcription = transcriber.transcribe("div")
        XCTAssertEqual(transcription, "ďiv")
    }
    
    func testTransribeDiLong() throws {
        let transcription = transcriber.transcribe("dílo")
        XCTAssertEqual(transcription, "ďi:lo")
    }
    
    func testTransribeTi() throws {
        let transcription = transcriber.transcribe("potit")
        XCTAssertEqual(transcription, "poťit")
    }
    
    func testTransribeTiLong() throws {
        let transcription = transcriber.transcribe("stín")
        XCTAssertEqual(transcription, "sťi:n")
    }
    
    func testTransribeNi() throws {
        let transcription = transcriber.transcribe("nic")
        XCTAssertEqual(transcription, "ňic")
    }
    
    func testTransribeNiLong() throws {
        let transcription = transcriber.transcribe("poník")
        XCTAssertEqual(transcription, "poňi:k")
    }
    
    func testTransribeDiAtOddPosition() throws {
        let transcription = transcriber.transcribe("plodí")
        XCTAssertEqual(transcription, "ploďi:")
    }
    
    func testTransribeCh() throws {
        let transcription = transcriber.transcribe("trochu")
        XCTAssertEqual(transcription, "troxu")
    }
    
    func testTransribeIa() throws {
        let transcription = transcriber.transcribe("rial")
        XCTAssertEqual(transcription, "rijal")
    }

    func testTransribeIe() throws {
        let transcription = transcriber.transcribe("Marie")
        XCTAssertEqual(transcription, "marije")
    }
    
    func testTransribeIo() throws {
        let transcription = transcriber.transcribe("kiosk")
        XCTAssertEqual(transcription, "kijosk")
    }
    
    func testTransribeIu() throws {
        let transcription = transcriber.transcribe("Fiurášek")
        XCTAssertEqual(transcription, "fijura:šek")
    }
}
