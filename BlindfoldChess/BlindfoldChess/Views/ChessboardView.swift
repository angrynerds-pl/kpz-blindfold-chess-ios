import Foundation
import SwiftUI
import SwiftChess


struct ChessboardView: View {
    
    var body: some View {
        
        CheckerBoard(board: 8)
            .fill(Color.blue)
            .frame(width: 400, height: 400)
    }
}

struct ChessboardView_Previes: PreviewProvider {
    static var previews: some View {
        ChessboardView()
    }
}
