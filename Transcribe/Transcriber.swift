public class Transcriber {
    
    private let prepositions: [String]
    private let wordTranscriber: WordTranscriber
    
    init() {
        self.prepositions = Preposition.allCases.map{ $0.rawValue }
        self.wordTranscriber = WordTranscriber()
    }
    
    func transcribe(input: String) -> String {
        let paragraph = transcribeParagraph(input)
        let addAbsoluteDelimiters = "\(Delimiters.absoluteStart)\(paragraph)\(Delimiters.absoluteEnd)"
        return addAbsoluteDelimiters
    }
    
    private func transcribeParagraph(_ input: String) -> String {
        let sentences = Tokenizer.asSentences(input)
        let transcribedSentences = sentences.map{
            transcribeSentence($0)
        }
        let joinedSentences = transcribedSentences[0..<transcribedSentences.count]
            .reduce(Delimiters.terminalDelimiter, { accum, next in
                return accum + next + Intonemes.fall +  Delimiters.terminalDelimiter
            })
        return joinedSentences
    }
    
    private func transcribeSentence(_ input: String) -> String {
        let words = Tokenizer.asWords(input)
        let transcribedWords = words.map{ wordTranscriber.transcribe(String($0)) }
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

}
