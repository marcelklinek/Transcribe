class SyllabicTranscriber {
    
    static func pairToPair(input: String) -> String {
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
    
    static func pairToOne(input: String) -> String {
        switch input {
        case "ch":
            return Transcription.chi.rawValue
        default:
            return input
        }
    }
    
    static func char(input: Character) -> String {
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
