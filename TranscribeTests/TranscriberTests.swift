import XCTest

class TranscriberTests: XCTestCase {
    
    func testTransribeSentence() throws {
        let transcriber = Transcriber()
        let transcription = transcriber.transcribe(input: "Tři zlaté vlasy děda Vševěda je pohádka Karla Jaromíra Erbena")
        let expectedResult = "/#tři+zlate:+vlasi+ďeda+vševjeda+je+poha:dka+karla+jaromi:ra+erbena↓#/"
        XCTAssertEqual(transcription, expectedResult)
    }
    
    func testTransribeParagraph() throws {
        let transcriber = Transcriber()
        let input = "Najednou se zastavil. To se rozumí, řekl si, vždyť to, co ten jasnovidec říkal, se může hodit na každého druhého! To jsou jen takové obecnosti. Každý člověk je tak trochu komediant a prospěchář."
        let transcription = transcriber.transcribe(input: input)
        let expectedResult = "/#najednou+se=zastavil↓#to+se=rozumi:+řekl+si+vždiť+to+co+ten+jasnovidec+ři:kal+se=mu:že+hoďit+na=každe:ho+druhe:ho↓#to+jsou+jen+takove:+obecnosťi↓#každi:+človjek+je+tak+troxu+komeďijant+a+prospjexa:ř↓#/"
        XCTAssertEqual(transcription, expectedResult)
    }
}
