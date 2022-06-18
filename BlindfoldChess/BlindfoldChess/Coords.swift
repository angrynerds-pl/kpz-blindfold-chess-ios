import Foundation
import SwiftUI

class Coord: Hashable {
    static func == (lhs: Coord, rhs: Coord) -> Bool {
        return lhs.file == rhs.file && lhs.rank == rhs.rank
    }
    
    var file: Int
    var rank: Int
    
    func getCoords() -> (Int, Int){
        return (rank, file)
    }
    
    init(_ r: Int,_ f: Int){
        file = f
        rank = r
    }
    
    func hash(into hasher: inout Hasher)
    {
        hasher.combine(file);
        hasher.combine(rank);
    }
}
