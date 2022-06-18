import Foundation
import SwiftUI

class Piece: ObservableObject {
    private var ID: Int
    private var COLOR: Int
    private var Piece_type: PieceTypes
    private var Piece_state: PlayState = .free
    private var Relations: [(Int, PlayState)] = []
    
    public var id: Int { get { return ID } }
    public var color: Int { get { return COLOR } }
    public var piece_type: PieceTypes { get {return Piece_type} set {Piece_type = newValue } }
    public var piece_state: PlayState { get { return Piece_state} set { Piece_state = newValue } }
    public var relations: [(Int, PlayState)] { get { return Relations } }
        
    init(_ i: Int,_ c: Int, _ p_t: PieceTypes){
        ID = i
        COLOR = c
        Piece_type = p_t
    }
    
    static func == (lhs: Piece, rhs: Piece) -> Bool {
        return lhs.id == rhs.id
    }
    
    func clearRelations() -> Void {
        if self.Relations.contains(where: {$0.1 == .en_passantable }){
            self.Relations = []
            self.addRelation(self.ID, .free)
            self.addRelation(self.ID, .en_passantable)
        } else if self.Relations.contains(where: {$0.1 == .promotion }){
            self.Relations = []
            self.addRelation(self.ID, .free)
            self.addRelation(self.ID, .promotion)
        } else {
            self.Relations = []
            self.addRelation(self.ID, .free)
        }
    }

    func getPieceRelation(_ p_ID: Int) -> PlayState {
        if let rel = Relations.first(where: {$0.0 == p_ID}) {
            return rel.1
        } else {
            return .free
        }
    }

    func addRelation(_ p_ID: Int, _ p_s: PlayState) -> Void {
        Relations.append((p_ID, p_s))
        if isThreatened() || isPinned() || isProtecting(){
            notFree()
        }
    }

    func removeRelation(_ p_ID: Int) -> Void {
        Relations.removeAll(where: {$0.0 == p_ID})
    }

    func isThreatened() -> Bool {
        if Relations.contains(where: {$0.1 == .is_threatening}) {
            return true
        }
        return false
    }

    func isPinned() -> Bool {
        if Relations.contains(where: {$0.1 == .is_pinning}) {
            return true
        }
        return false
    }

    func isProtecting() -> Bool {
        let kingID = COLOR == 1 ? 5 : 29
        if Relations.contains(where: {$0.0 == kingID && $0.1 == .protects}) {
            return true
        }
        return false
    }

    func beingPromoted() -> Bool {
        if Relations.contains(where: {$0.1 == .promotion}) {
            return true
        }
        return false
    }

    func notFree() -> Void {
        Relations.removeAll(where: {$0.1 == .free })
    }

    func isEnpassantable() -> Bool {
        if (self.piece_type == .wPawn || self.piece_type == .bPawn) && self.Relations.contains(where: {$0.1 == .en_passantable}) {
           return true
        } else {
            return false
        }
    }
    
    func STATE() -> PlayState {
        if beingPromoted() {
            return .promotion
        } else if isPinned() {
            return .is_pinning
        } else {
            if isProtecting() && isThreatened() {
                return .protects
            } else if isProtecting() && !isThreatened() {
                return .protects
            } else if !isProtecting() && isThreatened() {
                return .is_threatening
            }
        }
         return .free
    }
    
    func hash(into hasher: inout Hasher)
    {
        hasher.combine(id);
        hasher.combine(color);
        hasher.combine(piece_type);
    }
    
    func value() -> Int{
        switch self.piece_type {
            case .Queen:
                return 9
        case .Rook:
            return 5
        case .Bishop, .Knight:
            return 3
        case .bPawn, .wPawn:
            return 1
        case .King:
            return 0
        }
    }
}
