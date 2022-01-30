import XCTest

class TranscriberTests: XCTestCase {
    
    func testTransribeAlong() throws {
        let transcriber = Transcriber()
        let transcription = transcriber.transcribe(input: "pán")
        XCTAssertEqual(transcription, "/#pa:n#/")
    }
    
    func testTransribeElong() throws {
        let transcriber = Transcriber()
        let transcription = transcriber.transcribe(input: "fén")
        XCTAssertEqual(transcription, "/#fe:n#/")
    }
    
    func testTransribeIlong() throws {
        let transcriber = Transcriber()
        let transcription = transcriber.transcribe(input: "mír")
        XCTAssertEqual(transcription, "/#mi:r#/")
    }
    func testTransribeOlong() throws {
        let transcriber = Transcriber()
        let transcription = transcriber.transcribe(input: "gól")
        XCTAssertEqual(transcription, "/#go:l#/")
    }
    
    func testTransribeUlong() throws {
        let transcriber = Transcriber()
        let transcription = transcriber.transcribe(input: "úbk")
        XCTAssertEqual(transcription, "/#u:bk#/")
    }
    
    func testTransribeUring() throws {
        let transcriber = Transcriber()
        let transcription = transcriber.transcribe(input: "důl")
        XCTAssertEqual(transcription, "/#du:l#/")
    }
    
    func testTransribeEcaron() throws {
        let transcriber = Transcriber()
        let transcription = transcriber.transcribe(input: "květ")
        XCTAssertEqual(transcription, "/#kvjet#/")
    }
    
    func testTransribeDecaron() throws {
        let transcriber = Transcriber()
        let transcription = transcriber.transcribe(input: "děda")
        XCTAssertEqual(transcription, "/#ďeda#/")
    }
    
    func testTransribeDecaronCapital() throws {
        let transcriber = Transcriber()
        let transcription = transcriber.transcribe(input: "Děd Vševěd")
        XCTAssertEqual(transcription, "/#ďed+vševjed#/")
    }
    
    func testTransribeTecaron() throws {
        let transcriber = Transcriber()
        let transcription = transcriber.transcribe(input: "kutě")
        XCTAssertEqual(transcription, "/#kuťe#/")
    }
    
    func testTransribeNecaron() throws {
        let transcriber = Transcriber()
        let transcription = transcriber.transcribe(input: "něco")
        XCTAssertEqual(transcription, "/#ňeco#/")
    }
    
    func testTransribeDi() throws {
        let transcriber = Transcriber()
        let transcription = transcriber.transcribe(input: "div")
        XCTAssertEqual(transcription, "/#ďiv#/")
    }
    
    func testTransribeDiLong() throws {
        let transcriber = Transcriber()
        let transcription = transcriber.transcribe(input: "dílo")
        XCTAssertEqual(transcription, "/#ďi:lo#/")
    }
    
    func testTransribeTi() throws {
        let transcriber = Transcriber()
        let transcription = transcriber.transcribe(input: "potit")
        XCTAssertEqual(transcription, "/#poťit#/")
    }
    
    func testTransribeTiLong() throws {
        let transcriber = Transcriber()
        let transcription = transcriber.transcribe(input: "stín")
        XCTAssertEqual(transcription, "/#sťi:n#/")
    }
    
    func testTransribeNi() throws {
        let transcriber = Transcriber()
        let transcription = transcriber.transcribe(input: "nic")
        XCTAssertEqual(transcription, "/#ňic#/")
    }
    
    func testTransribeNiLong() throws {
        let transcriber = Transcriber()
        let transcription = transcriber.transcribe(input: "poník")
        XCTAssertEqual(transcription, "/#poňi:k#/")
    }
    
    func testTransribeDiAtOddPosition() throws {
        let transcriber = Transcriber()
        let transcription = transcriber.transcribe(input: "plodí")
        XCTAssertEqual(transcription, "/#ploďi:#/")
    }
    
    func testTransribeCh() throws {
        let transcriber = Transcriber()
        let transcription = transcriber.transcribe(input: "trochu")
        XCTAssertEqual(transcription, "/#troxu#/")
    }
    
    func testTransribeIa() throws {
        let transcriber = Transcriber()
        let transcription = transcriber.transcribe(input: "rial")
        XCTAssertEqual(transcription, "/#rijal#/")
    }

    func testTransribeIe() throws {
        let transcriber = Transcriber()
        let transcription = transcriber.transcribe(input: "Marie")
        XCTAssertEqual(transcription, "/#marije#/")
    }
    
    func testTransribeIo() throws {
        let transcriber = Transcriber()
        let transcription = transcriber.transcribe(input: "kiosk")
        XCTAssertEqual(transcription, "/#kijosk#/")
    }
    
    func testTransribeIu() throws {
        let transcriber = Transcriber()
        let transcription = transcriber.transcribe(input: "Fiurášek")
        XCTAssertEqual(transcription, "/#fijura:šek#/")
    }
    
    func testTransribeSentence() throws {
        let transcriber = Transcriber()
        let transcription = transcriber.transcribe(input: "Tři zlaté vlasy děda Vševěda je pohádka Karla Jaromíra Erbena")
        let expectedResult = "/#tři+zlate:+vlasi+ďeda+vševjeda+je+poha:dka+karla+jaromi:ra+erbena#/"
        XCTAssertEqual(transcription, expectedResult)
    }
    
    func testTransribeParagraph() throws {
        let transcriber = Transcriber()
        let input = "Najednou se zastavil. To se rozumí, řekl si, vždyť to, co ten jasnovidec říkal, se může hodit na každého druhého! To jsou jen takové obecnosti. Každý člověk je tak trochu komediant a prospěchář."
        let transcription = transcriber.transcribe(input: input)
        let expectedResult = """
        /#najednou+se=zastavil#to+se=rozumi:+řekl+si+vždiť+to+co+ten+jasnovidec+ři:kal+se=mu:že+hoďit+na=každe:ho+druhe:ho#to+jsou+jen+takove:+obecnosťi#každi:+človjek+je+tak+troxu+komeďijant+a+prospjexa:ř#/
        """
        XCTAssertEqual(transcription, expectedResult)
    }
}
