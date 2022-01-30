import Foundation

if let input = InputCollector().collect() {
    let transcription = Transcriber().transcribe(input: input)
    print(transcription)
}
exit(0)
