import Foundation
import SwiftUI

struct PieceView: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    let piece: String
    
    var body: some View {
        Text("\(piece)")
        CheckerBoard(board: 4)
            .fill(Color.green)
            .frame(width: 300, height: 300)
        Image("BlackKing")
            .resizable()
            .frame(width: 70, height: 70)
            .position(x: 195,
                      y: -120)
    }
}

struct PieceView_Previews: PreviewProvider {
    static var previews: some View {
        PieceView(piece: "King")
    }
}

