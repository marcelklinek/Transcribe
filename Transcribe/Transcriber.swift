public class Transcriber {
    
    private let prepositions = Preposition.allCases.map{ $0.rawValue }
    
    func transcribe(input: String) -> String {
        let lowercaseString = input.lowercased()
        let paragraph = transcribeParagraph(lowercaseString)
        let addAbsoluteDelimiters = "\(TranscribeConstants.absoluteStart)\(paragraph)\(TranscribeConstants.absoluteEnd)"
        return addAbsoluteDelimiters
    }
    
    private func transcribeParagraph(_ input: String) -> String {
        let sentences = Tokenizer.asSentences(input)
        let transcribedSentences = sentences.map{
            transcribeSentence($0)
        }
        let joinedSentences = transcribedSentences[0..<transcribedSentences.count]
            .reduce(TranscribeConstants.terminalDelimiter, { accum, next in
                return accum + next + TranscribeConstants.terminalDelimiter
            })
        return joinedSentences
    }
    
    private func transcribeSentence(_ input: String) -> String {
        let words = Tokenizer.asWords(input)
        let transcribedWords = words.map{ transcribeWord(String($0)) }
        return joinWords(transcribedWords)
    }
    
    private func joinWords(_ transcribedWords: [String]) -> String {
        var joinedWords = transcribedWords[0..<transcribedWords.count - 1]
            .reduce("", { accum, nextWord in
                if wordIsPreposition(nextWord) {
                    return accum + nextWord + "="
                } else {
                    return accum + nextWord + "+"
                }
            })
        // last word in sentence ends with terminal delimiter, not outer/inner
        joinedWords.append(transcribedWords.last!)
        return joinedWords
    }
    
    private func wordIsPreposition(_ word: String) -> Bool {
        return prepositions.contains(word)
    }
    
    private func transcribeWord(_ input: String) -> String {
        let oddPairs = Tokenizer.asPairs(input, skipFirstLetter: false)
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
