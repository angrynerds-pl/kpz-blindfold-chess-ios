import Foundation
import SwiftUI

struct Square: View {
    var coords: (Int, Int)
    
    func getColor() -> Color {
        if(coords.0 % 2 == 0) {
            if(coords.1 % 2 == 0){
                return Color(.black)
            } else {
                return Color(.white)
            }
        } else {
            if(coords.1 % 2 == 0){
                return Color(.white)
            } else {
                return Color(.black)
            }
        }
    }
    
    var body: some View {
        Rectangle()
            .foregroundColor(getColor())
            .frame(width: 46, height: 46)
    }
}
