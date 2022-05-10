import Foundation
import SwiftUI

struct CheckerBoard: Shape {
    let board: Int

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let rows = board
        let cols = board

        let rowSize = rect.height / CGFloat(rows)
        let colSize = rect.width / CGFloat(cols)

        for row in 0 ..< rows {
            for col in 0 ..< cols {
                if (row + col).isMultiple(of: 2) {
                    let startX = colSize * CGFloat(col)
                    let startY = rowSize * CGFloat(row)

                    let rect = CGRect(x: startX, y: startY, width: colSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }

        return path
    }
}

struct PieceView: View {
    let piece: String
    
    var body: some View {
        Text("\(piece)")
        CheckerBoard(board: 4)
            .fill(Color.blue)
            .frame(width: 300, height: 300)
    }
}

struct PieceView_Previews: PreviewProvider {
    static var previews: some View {
        PieceView(piece: "King")
    }
}

