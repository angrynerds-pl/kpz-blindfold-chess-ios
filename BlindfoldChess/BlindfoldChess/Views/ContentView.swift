import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello World!")
                Spacer()
                NavigationLink(destination: PiecesView()) {
                    Text("Go to pieces")
                }
                NavigationLink(destination: ChessboardView()) {
                    Text("Play")
                }
            }
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
