import Foundation
import SwiftUI
import SwiftChess

struct PiecesView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack() {
                Divider()
                HStack() {
                    Image("BlackPawn")
                        .resizable()
                        .frame(width: 32.0, height: 32.0)
                    Text("Pawn")
                }.padding(20)
            }.onTapGesture {
                print("Pawn")
            }
            VStack() {
                Divider()
                HStack() {
                    Image("BlackRook")
                        .resizable()
                        .frame(width: 32.0, height: 32.0)
                    Text("Rook")
                }.padding(20)
            }.onTapGesture {
                print("Rook")
            }
            VStack() {
                Divider()
                HStack() {
                    Image("BlackBishop")
                        .resizable()
                        .frame(width: 32.0, height: 32.0)
                    Text("Bishop")
                }.padding(20)
            }.onTapGesture {
                print("Bishop")
            }
            VStack() {
                Divider()
                HStack() {
                    Image("BlackKnight")
                        .resizable()
                        .frame(width: 32.0, height: 32.0)
                    Text("Knight")
                }.padding(20)
            }.onTapGesture {
                print("Knight")
            }
            VStack() {
                Divider()
                HStack() {
                    Image("BlackQueen")
                        .resizable()
                        .frame(width: 32.0, height: 32.0)
                    Text("Queen")
                }.padding(20)
            }.onTapGesture {
                print("Queen")
            }
            VStack() {
                Divider()
                HStack() {
                    Image("BlackKing")
                        .resizable()
                        .frame(width: 32.0, height: 32.0)
                    Text("King")
                }.padding(20)
            }.onTapGesture {
                print("King")
            }
            Divider()
        }
    }
}

struct PiecesView_Previews: PreviewProvider {
    static var previews: some View {
        PiecesView()
    }
}
