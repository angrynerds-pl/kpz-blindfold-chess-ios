import SwiftUI

struct ContentView: View {
    @StateObject var GameStatus = Game()
    var body: some View {
        MovingView()
            .environmentObject(GameStatus)
        Spacer()
        SpeechView()
            .environmentObject(GameStatus)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
