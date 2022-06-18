import Foundation
import SwiftUI

struct HolderView: View, Hashable {
    @EnvironmentObject var Game: Game
    var id: Int
    var piece_ID: Int = 0
    var highlight: Bool { Game.PossibleMoves.contains(id) ? true : false }
    
    
    func hash(into hasher: inout Hasher)
    {
        hasher.combine(id);
        hasher.combine(piece_ID);
    }

    static func == (lhs: HolderView, rhs: HolderView) -> Bool {
        return lhs.id == rhs.id && lhs.piece_ID == rhs.piece_ID
    }

    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color.white.opacity(0.01))
                .frame(width: 46, height: 46)
                .background(highlight ? Color.blue.opacity(0.5) : Color.white.opacity(0))
//            Text(id.description)
//                .foregroundColor(.red).opacity(0.7)
            if(piece_ID > 0 ){
                PieceView(piece_ID: piece_ID)
            }
        }
        .onTapGesture {
            Game.ChosenHolder = id
            if(Game.isPicked){
                Game.put()
            }
        }
    }
}
