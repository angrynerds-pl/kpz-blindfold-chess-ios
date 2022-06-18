import SwiftUI
import SwiftSpeech
import Foundation

struct SpeechView: View {
    @EnvironmentObject var Game: Game
    private let greeting: String = "Hold here to speek"
    private let locale = "en_US"
    private let regex: String = "(King|Queen|Rook|Bishop|Knight|Pawn).(to).[A-H].(one|two|three|four|five|six|seven|eight)"
    @State private var result: String = ""
    @State var isTapped = false
    
    public init() { }

    public var body: some View {
        VStack() {
            VStack() {
                HStack() {
                    Text(greeting)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .foregroundColor(.black)
                        .padding(5)
                    SwiftSpeech.RecordButton()
                        .accentColor(.blue)
                        .swiftSpeechRecordOnHold(locale: Locale(identifier: locale), animation: .spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0))
                        .onRecognizeLatest(update: $result)
                        .onChange(of: result) { newValue in
                            let results = getResults(for: regex, in: result)
                            if results.count > 0 {
                                    let result = results[0]
                                    print(parseResults(result: result))
                            }
                        }
                }
                Text(result)
                    .font(.system(size: 15, weight: .medium, design: .default))
                    .foregroundColor(.black)
            }.onAppear {
                SwiftSpeech.requestSpeechRecognitionAuthorization()
            }
        }
    }
    func getResults(for regex: String, in result: String) -> [String] {
        let moves: [String] = result.components(separatedBy: " ")
        for move in moves {
            let move = move.lowercased()
            if move == "start" {
                Game.set()
            }
            if move == "pawn" {
                if(!Game.isPicked) {
                    isTapped.toggle()
                    Game.ChosenPieceID = 9
                    Game.isPicked = true
                    print(Game.PossibleMoves)
                    Game.ChosenHolder = 24
                    Game.put()
                }
            }
        }
        print(moves)
        return moves
//        do {
//            let regex = try NSRegularExpression(pattern: regex)
//            let results = regex.matches(in: result,
//                    range: NSRange(result.startIndex..., in: result))
//
//            return results.map {
//                String(result[Range($0.range, in: result)!])
//            }
//        } catch let error {
//            print("invalid regex: \(error.localizedDescription)")
//            return []
//        }
    }
    
    func parseResults(result: String) -> [String] {
        let moves: [String] = result.components(separatedBy: " ")
        
        return moves
    }
}

struct SpeechView_Previews: PreviewProvider {
    static var previews: some View {
        SpeechView()
    }
}
