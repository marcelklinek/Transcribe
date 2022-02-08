import XCTest

class WordTranscriberTests: XCTestCase {
    
    var transcriber: WordTranscriber!
    
    override func setUp() {
        transcriber = WordTranscriber()
    }
    
    override func tearDown() {
        transcriber = nil
    }
    
    func testTranscribeAlong() throws {
        let transcription = transcriber.transcribe("pán")
        XCTAssertEqual(transcription, "pa:n")
    }
    
    func testTranscribeElong() throws {
        let transcription = transcriber.transcribe("fén")
        XCTAssertEqual(transcription, "fe:n")
    }
    
    func testTranscribeIlong() throws {
        let transcription = transcriber.transcribe("mír")
        XCTAssertEqual(transcription, "mi:r")
    }
    func testTranscribeOlong() throws {
        let transcription = transcriber.transcribe("gól")
        XCTAssertEqual(transcription, "go:l")
    }
    
    func testTranscribeUlong() throws {
        let transcription = transcriber.transcribe("úbk")
        XCTAssertEqual(transcription, "u:bk")
    }
    
    func testTranscribeUring() throws {
        let transcription = transcriber.transcribe("důl")
        XCTAssertEqual(transcription, "du:l")
    }
    
    func testTranscribeEcaron() throws {
        let transcription = transcriber.transcribe("květ")
        XCTAssertEqual(transcription, "kvjet")
    }
    
    func testTranscribeDecaron() throws {
        let transcription = transcriber.transcribe("děd")
        XCTAssertEqual(transcription, "ďed")
    }
    
    func testTranscribeDecaronCapital() throws {
        let transcription = transcriber.transcribe("Vševěd")
        XCTAssertEqual(transcription, "vševjed")
    }
    
    func testTranscribeTecaron() throws {
        let transcription = transcriber.transcribe("kutě")
        XCTAssertEqual(transcription, "kuťe")
    }
    
    func testTranscribeNecaron() throws {
        let transcription = transcriber.transcribe("něco")
        XCTAssertEqual(transcription, "ňeco")
    }
    
    func testTranscribeDi() throws {
        let transcription = transcriber.transcribe("div")
        XCTAssertEqual(transcription, "ďiv")
    }
    
    func testTranscribeDiLong() throws {
        let transcription = transcriber.transcribe("dílo")
        XCTAssertEqual(transcription, "ďi:lo")
    }
    
    func testTranscribeTi() throws {
        let transcription = transcriber.transcribe("potit")
        XCTAssertEqual(transcription, "poťit")
    }
    
    func testTranscribeTiLong() throws {
        let transcription = transcriber.transcribe("stín")
        XCTAssertEqual(transcription, "sťi:n")
    }
    
    func testTranscribeNi() throws {
        let transcription = transcriber.transcribe("nic")
        XCTAssertEqual(transcription, "ňic")
    }
    
    func testTranscribeNiLong() throws {
        let transcription = transcriber.transcribe("poník")
        XCTAssertEqual(transcription, "poňi:k")
    }
    
    func testTranscribeDiAtOddPosition() throws {
        let transcription = transcriber.transcribe("plodí")
        XCTAssertEqual(transcription, "ploďi:")
    }
    
    func testTranscribeCh() throws {
        let transcription = transcriber.transcribe("trochu")
        XCTAssertEqual(transcription, "troxu")
    }
    
    func testTranscribeIa() throws {
        let transcription = transcriber.transcribe("rial")
        XCTAssertEqual(transcription, "rijal")
    }

    func testTranscribeIe() throws {
        let transcription = transcriber.transcribe("Marie")
        XCTAssertEqual(transcription, "marije")
    }
    
    func testTranscribeIo() throws {
        let transcription = transcriber.transcribe("kiosk")
        XCTAssertEqual(transcription, "kijosk")
    }
    
    func testTranscribeIu() throws {
        let transcription = transcriber.transcribe("Fiurášek")
        XCTAssertEqual(transcription, "fijura:šek")
    }
    
    func testTranscribePrefix() throws {
        let transcription = transcriber.transcribe("vybrat")
        XCTAssertEqual(transcription, "vi=brat")
    }
}
