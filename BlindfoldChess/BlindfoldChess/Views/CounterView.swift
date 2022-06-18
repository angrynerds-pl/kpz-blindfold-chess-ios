import Foundation
import SwiftUI

struct PlayerCounter: View {
    @EnvironmentObject var Game: Game
    var color: Int
    var body: some View {
        ZStack{
            Capsule().foregroundColor(.white).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            HStack{
                Text("PlayerName")
                Text("Points: \( color == 1 ? Game.WPCounter : Game.BPCounter )")
                
            }
        }.frame(width: 368, height: 60, alignment: .center)

    }
}
