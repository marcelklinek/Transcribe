class WordTranscriber {
    func transcribe(_ input: String) -> String {
        let lowercaseString = input.lowercased()
        let oddPairs = Tokenizer.asPairs(lowercaseString, skipFirstLetter: false)
        let intermediateResult = oddPairs.map{ SyllabicTranscriber.pairToPair(input: $0) }
        
        let evenPairs = Tokenizer.asPairs(intermediateResult.joined(), skipFirstLetter: true)
        let intermediateResult2 = evenPairs.map{ SyllabicTranscriber.pairToPair(input: $0) }
        
        let oddPairsToOne = Tokenizer.asPairs(intermediateResult2.joined(), skipFirstLetter: false)
        let intermediateResult3 = oddPairsToOne.map{ SyllabicTranscriber.pairToOne(input: $0) }
        
        let evenPairsToOne = Tokenizer.asPairs(intermediateResult3.joined(), skipFirstLetter: true)
        let intermediateResult4 = evenPairsToOne.map{ SyllabicTranscriber.pairToOne(input: $0) }
        
        let characters = Tokenizer.asChars(intermediateResult4.joined())
        let result = characters.map{ SyllabicTranscriber.char(input: $0) }
        
        return result.joined()
    }
}
