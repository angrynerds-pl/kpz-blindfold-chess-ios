import Foundation
import SwiftUI

struct Chessboard: View {
    var files = [0,1,2,3,4,5,6,7]
    var ranks = [0,1,2,3,4,5,6,7]
    
    var body: some View{
        VStack(alignment: .center, spacing: 0){
            PlayerCounter(color: 0)
            ForEach(ranks.reversed(), id: \.self) { file in
                HStack(alignment: .center, spacing: 0){
                    ForEach(files, id: \.self) { rank in
                        Square(coords: (rank,file))
                    }
                }
            }
            PlayerCounter(color: 1)
        }
        .border(Color.black, width: 1)
    }
}
