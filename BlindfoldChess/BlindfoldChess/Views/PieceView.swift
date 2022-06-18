import Foundation
import SwiftUI

struct PieceView: View {
    @EnvironmentObject var Game: Game
    @State var isTapped = false
    var piece_ID: Int
    var imgName: String {
        switch Game.Pieces[piece_ID-1].piece_type {
        case .wPawn:
            return "WhitePawn"
        case .bPawn:
            return "BlackPawn"
        case .Bishop:
            return Game.Pieces[piece_ID-1].color == 1 ? "WhiteBishop" : "BlackBishop"
        case .Knight:
            return Game.Pieces[piece_ID-1].color == 1 ? "WhiteKnight" : "BlackKnight"
        case .Rook:
            return Game.Pieces[piece_ID-1].color == 1 ? "WhiteRook" : "BlackRook"
        case .Queen:
            return  Game.Pieces[piece_ID-1].color == 1 ? "WhiteQueen" : "BlackQueen"
        case .King:
            return Game.Pieces[piece_ID-1].color == 1 ? "WhiteKing" : "BlackKing"
        }
    }
    var body: some View {
        ZStack{
                Image(imgName).resizable()
                    .scaledToFit().frame(width: isTapped ? 48:42 , height: isTapped ? 48:42, alignment: .center)
                .onTapGesture {
                    if(!Game.isPicked){
                        isTapped.toggle()
                        Game.ChosenPieceID = piece_ID
                        Game.isPicked = true
                        Game.showPossibleMoves()
                    } else if (Game.isPicked && Game.ChosenPieceID == self.piece_ID) {
                        isTapped = false
                        Game.isPicked = false
                        Game.hidePossibileMoves()
                    } else if (Game.isPicked && Game.ChosenPieceID != self.piece_ID) {
                        Game.Attack(piece_ID)
                    }
                }
//            Text(piece_ID.description)
//                .foregroundColor(.white)
//                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        }
        .frame(width: 46, height: 46)
    }
}
