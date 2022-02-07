import XCTest

class TranscriberTests: XCTestCase {
    
    var transcriber: Transcriber!
    
    override func setUp() {
        transcriber = Transcriber()
    }
    
    override func tearDown() {
        transcriber = nil
    }
    
    func testTranscribeSentence() throws {
        let transcription = transcriber.transcribe(input: "Tři zlaté vlasy děda Vševěda je pohádka Karla Jaromíra Erbena")
        let expectedResult = "/#tři+zlate:+vlasi+ďeda+vševjeda+je+poha:dka+karla+jaromi:ra+erbena↓#/"
        XCTAssertEqual(transcription, expectedResult)
    }
    
    func testTranscribeParagraph() throws {
        let input = "Najednou se zastavil. To se rozumí, řekl si, vždyť to, co ten jasnovidec říkal, se může hodit na každého druhého! To jsou jen takové obecnosti. Každý člověk je tak trochu komediant a prospěchář."
        let transcription = transcriber.transcribe(input: input)
        let expectedResult = "/#najednou+se=zastavil↓#to+se=rozumi:+řekl+si+vždiť+to+co+ten+jasnovidec+ři:kal+se=mu:že+hoďit+na=každe:ho+druhe:ho↓#to+jsou+jen+takove:+obecnosťi↓#každi:+človjek+je+tak+troxu+komeďijant+a+prospjexa:ř↓#/"
        XCTAssertEqual(transcription, expectedResult)
    }
    
    func testTranscribeAnotherParagraph() throws {
        let input = "Doktor Goldberg byl, pokud mohl zjistit, poslední, kdo Jana Bendu viděl. Někdy koncem srpna s ním ještě podnikl triumfální tažení noční Prahou; ale pak už Benda nepřišel na žádnou obvyklou schůzku. Snad stůně, řekl si konečně doktor Goldberg a zajel si jednou večer do Bendova bytu; bylo to právě prvního září."
        let transcription = transcriber.transcribe(input: input)
        let expectedResult = "/#doktor+goldberg+bil+pokud+mohl+zjisťit+posledňi:+kdo+jana+bendu+viďel↓#ňekdi+koncem+srpna+s=ňi:m+ješťe+podňikl+trijumfa:lňi:+tažeňi:+nočňi:+prahou↓#ale+pak+už+benda+nepřišel+na=ža:dnou+obviklou+sxu:zku↓#snad+stu:ňe+řekl+si+konečňe+doktor+goldberg+a+zajel+si+jednou+večer+do=bendova+bitu↓#bilo+to+pra:vje+prvňi:ho+za:ři:↓#/"
        XCTAssertEqual(transcription, expectedResult)
    }
}
