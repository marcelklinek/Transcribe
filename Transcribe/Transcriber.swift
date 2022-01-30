public class Transcriber {
    
    func transcribe(input: String) -> String {
        let lowercaseString = input.lowercased()
        let sentences = Tokenizer.tokenizeAsSentences(lowercaseString)
        let transcribedSentences = sentences.map{
            transcribeSentence($0)
        }
        let joinedSentences = transcribedSentences[0..<transcribedSentences.count]
            .reduce(TranscribeConstants.terminalDelimiter, { accum, next in
                return accum + next + TranscribeConstants.terminalDelimiter
            })
        let addStartEndSequences = "\(TranscribeConstants.absoluteStart)\(joinedSentences)\(TranscribeConstants.absoluteEnd)"
        return addStartEndSequences
    }
    
    private func transcribeSentence(_ input: String) -> String {
        let words = Tokenizer.tokenizeAsWords(input)
        let transcribedWords = words.map{ transcribeWord(String($0)) }
        let prepositions = Preposition.allCases.map{ $0.rawValue }
        var joinedWords = transcribedWords[0..<transcribedWords.count - 1].reduce("", { accum, next in
            if prepositions.contains(next) {
                return accum + next + "="
            } else {
                return accum + next + "+"
            }
        })
        joinedWords.append(transcribedWords.last!)
        return joinedWords
    }
    
    private func transcribeWord(_ input: String) -> String {
        let oddPairs = Tokenizer.tokenizeAsPairs(input, skipFirstLetter: false)
        let intermediateResult = oddPairs.map{ transcribePairToPair(input: $0) }
        
        let evenPairs = Tokenizer.tokenizeAsPairs(intermediateResult.joined(), skipFirstLetter: true)
        let intermediateResult2 = evenPairs.map{ transcribePairToPair(input: $0) }
        
        let oddPairsToOne = Tokenizer.tokenizeAsPairs(intermediateResult2.joined(), skipFirstLetter: false)
        let intermediateResult3 = oddPairsToOne.map{ transcribePairToOne(input: $0) }
        
        let evenPairsToOne = Tokenizer.tokenizeAsPairs(intermediateResult3.joined(), skipFirstLetter: true)
        let intermediateResult4 = evenPairsToOne.map{ transcribePairToOne(input: $0) }
        
        let characters = Tokenizer.tokenizeAsChars(intermediateResult4.joined())
        let result = characters.map{ transcribeChar(input: $0) }
        
        return result.joined()
    }
    
    private func transcribePairToPair(input: String) -> String {
        switch input {
        case "dě":
            return Transcription.de.rawValue
        case "tě":
            return Transcription.te.rawValue
        case "ně":
            return Transcription.ne.rawValue
        case "di":
            return Transcription.di.rawValue
        case "ti":
            return Transcription.ti.rawValue
        case "ni":
            return Transcription.ni.rawValue
        case "dí":
            return Transcription.dilong.rawValue
        case "tí":
            return Transcription.tilong.rawValue
        case "ní":
            return Transcription.nilong.rawValue
        case "ia":
            return Transcription.ia.rawValue
        case "ie":
            return Transcription.ie.rawValue
        case "io":
            return Transcription.io.rawValue
        case "iu":
            return Transcription.iu.rawValue
        default:
            return input
        }
    }
    
    private func transcribePairToOne(input: String) -> String {
        switch input {
        case "ch":
            return Transcription.chi.rawValue
        default:
            return input
        }
    }
    
    private func transcribeChar(input: Character) -> String {
        switch input {
        case "á":
            return Transcription.along.rawValue
        case "é":
            return Transcription.elong.rawValue
        case "í", "ý":
            return Transcription.ilong.rawValue
        case "y":
            return Transcription.ypsilon.rawValue
        case "ó":
            return Transcription.olong.rawValue
        case "ú", "ů":
            return Transcription.ulong.rawValue
        case "ě":
            return Transcription.ecaron.rawValue
        default:
            return String(input)
        }
    }
}
