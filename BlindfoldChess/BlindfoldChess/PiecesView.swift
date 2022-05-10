import Foundation
import SwiftUI
import SwiftChess

struct PiecesView: View {
    let pieces = [
        "Pawn",
        "Rook",
        "Bishop",
        "Knight",
        "Queen",
        "King",
    ]
    
    var body: some View {
        NavigationView {
            List(pieces, id: \.self) { piece in
                NavigationLink(destination: PieceView(piece: piece)) {
                    Image(parseImageName(piece: piece))
                        .resizable()
                        .frame(width: 24.0, height: 24.0)
                    Text(piece)
                }.navigationBarTitle("Select piece to see more information", displayMode: .inline)
            }
        }
    }
}

struct PiecesView_Previews: PreviewProvider {
    static var previews: some View {
        PiecesView()
    }
}

func parseImageName(piece:String) -> String {
    return "Black\(piece)"
}
