import Foundation
import SwiftUI

struct PromotionView: View {
    @EnvironmentObject var Game: Game
    var body: some View {
        ZStack {
            Color.gray.opacity(0.5)
                //.ignoresSafeArea()
            VStack(alignment: .center, spacing: 5) {
                Text("Promote to:")
                Button(action: {
                    Game.promoteTo(.Queen)
                    Game.showPromotion.toggle()
                }, label: {
                    Text("Queen")
                })
                Button(action: {
                    Game.promoteTo(.Rook)
                    Game.showPromotion.toggle()
                }, label: {
                    Text("Rook")
                })
                Button(action: {
                    Game.promoteTo(.Bishop)
                    Game.showPromotion.toggle()
                }, label: {
                    Text("Bishop")
                })
                Button(action: {
                    Game.promoteTo(.Knight)
                    Game.showPromotion.toggle()
                }, label: {
                    Text("Knight")
                })
            }.frame(width: 140, height: 140, alignment: .center)
            .background(Color.white)
            .cornerRadius(5)
        }
        .frame(width: 500, height: 420, alignment: .center)
    }
}
