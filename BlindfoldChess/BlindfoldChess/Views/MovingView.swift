import Foundation
import SwiftUI

struct MovingView: View {
    @EnvironmentObject var Game: Game
    @State var showPromotion = false
    @State var promo_piece = 0
    var body: some View {
        VStack{
            Button(action: { Game.set() }, label: {
                Text("Start")
            })
            ZStack{
                Chessboard()
                VStack(alignment: .center, spacing: 0){
                    HStack(alignment: .center, spacing: 0){
                        ForEach(Game.Holders, id: \.self) { Holder in
                            if(Holder.id > 55 && Holder.id < 64) {
                                Holder
                            }
                        }
                    }
                    HStack(alignment: .center, spacing: 0){
                        ForEach(Game.Holders, id: \.self) { Holder in
                            if(Holder.id > 47 && Holder.id < 56) {
                                Holder
                            }
                        }
                    }
                    HStack(alignment: .center, spacing: 0){
                        ForEach(Game.Holders, id: \.self) { Holder in
                            if(Holder.id > 39 && Holder.id < 48) {
                                Holder
                            }
                        }
                    }
                    HStack(alignment: .center, spacing: 0){
                        ForEach(Game.Holders, id: \.self) { Holder in
                            if(Holder.id > 31 && Holder.id < 40) {
                                Holder
                            }
                        }
                    }
                    HStack(alignment: .center, spacing: 0){
                        ForEach(Game.Holders, id: \.self) { Holder in
                            if(Holder.id > 23 && Holder.id < 32) {
                                Holder
                            }
                        }
                    }
                    HStack(alignment: .center, spacing: 0){
                        ForEach(Game.Holders, id: \.self) { Holder in
                            if(Holder.id > 15 && Holder.id < 24) {
                                Holder
                            }
                        }
                    }
                    HStack(alignment: .center, spacing: 0){
                        ForEach(Game.Holders, id: \.self) { Holder in
                            if(Holder.id > 7 && Holder.id < 16) {
                                Holder
                            }
                        }
                    }
                    HStack(alignment: .center, spacing: 0){
                        ForEach(Game.Holders, id: \.self) { Holder in
                            if(Holder.id < 8){
                                Holder
                            }
                        }
                    }
                }
                if(Game.showPromotion){
                    PromotionView()
                }
            }
        }
    }
}
