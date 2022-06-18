import SwiftUI

class Game: ObservableObject {
    @Published var fields: [Int] = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,999]
    
    @Published var Holders: [HolderView] = [
        HolderView(id: 0),HolderView(id: 1),HolderView(id: 2),HolderView(id: 3),HolderView(id: 4),HolderView(id: 5),HolderView(id: 6),HolderView(id: 7),
        HolderView(id: 8),HolderView(id: 9),HolderView(id: 10),HolderView(id: 11),HolderView(id: 12),HolderView(id: 13),HolderView(id: 14),HolderView(id: 15),
        HolderView(id: 16),HolderView(id: 17),HolderView(id: 18),HolderView(id: 19),HolderView(id: 20),HolderView(id: 21),HolderView(id: 22),HolderView(id: 23),
        HolderView(id: 24),HolderView(id: 25),HolderView(id: 26),HolderView(id: 27),HolderView(id: 28),HolderView(id: 29),HolderView(id: 30),HolderView(id: 31),
        HolderView(id: 32),HolderView(id: 33),HolderView(id: 34),HolderView(id: 35),HolderView(id: 36),HolderView(id: 37),HolderView(id: 38),HolderView(id: 39),
        HolderView(id: 40),HolderView(id: 41),HolderView(id: 42),HolderView(id: 43),HolderView(id: 44),HolderView(id: 45),HolderView(id: 46),HolderView(id: 47),
        HolderView(id: 48),HolderView(id: 49),HolderView(id: 50),HolderView(id: 51),HolderView(id: 52),HolderView(id: 53),HolderView(id: 54),HolderView(id: 55),
        HolderView(id: 56),HolderView(id: 57),HolderView(id: 58),HolderView(id: 59),HolderView(id: 60),HolderView(id: 61),HolderView(id: 62),HolderView(id: 63),
        HolderView(id: 999),
    ]
    
    var Coordinates: [Coord] = [
        Coord(0, 0),Coord(0, 1),Coord(0, 2),Coord(0, 3),Coord(0, 4),Coord(0, 5),Coord(0, 6),Coord(0, 7),
        Coord(1, 0),Coord(1, 1),Coord(1, 2),Coord(1, 3),Coord(1, 4),Coord(1, 5),Coord(1, 6),Coord(1, 7),
        Coord(2, 0),Coord(2, 1),Coord(2, 2),Coord(2, 3),Coord(2, 4),Coord(2, 5),Coord(2, 6),Coord(2, 7),
        Coord(3, 0),Coord(3, 1),Coord(3, 2),Coord(3, 3),Coord(3, 4),Coord(3, 5),Coord(3, 6),Coord(3, 7),
        Coord(4, 0),Coord(4, 1),Coord(4, 2),Coord(4, 3),Coord(4, 4),Coord(4, 5),Coord(4, 6),Coord(4, 7),
        Coord(5, 0),Coord(5, 1),Coord(5, 2),Coord(5, 3),Coord(5, 4),Coord(5, 5),Coord(5, 6),Coord(5, 7),
        Coord(6, 0),Coord(6, 1),Coord(6, 2),Coord(6, 3),Coord(6, 4),Coord(6, 5),Coord(6, 6),Coord(6, 7),
        Coord(7, 0),Coord(7, 1),Coord(7, 2),Coord(7, 3),Coord(7, 4),Coord(7, 5),Coord(7, 6),Coord(7, 7),
        Coord(999, 999),
    ]
    
    @Published var Pieces: [Piece] = [Piece(1,1,.Rook),Piece(2,1,.Knight),Piece(3,1,.Bishop),Piece(4,1,.Queen),Piece(5,1,.King),Piece(6,1,.Bishop),Piece(7,1,.Knight),Piece(8,1,.Rook),Piece(9,1,.wPawn),Piece(10,1,.wPawn),Piece(11,1,.wPawn),Piece(12,1,.wPawn),Piece(13,1,.wPawn),Piece(14,1,.wPawn),Piece(15,1,.wPawn),Piece(16,1,.wPawn),Piece(17,0,.bPawn),Piece(18,0,.bPawn),Piece(19,0,.bPawn),Piece(20,0,.bPawn),Piece(21,0,.bPawn),Piece(22,0,.bPawn),Piece(23,0,.bPawn),Piece(24,0,.bPawn),Piece(25,0,.Rook),Piece(26,0,.Knight),Piece(27,0,.Bishop),Piece(28,0,.Queen),Piece(29,0,.King),Piece(30,0,.Bishop),Piece(31,0,.Knight),Piece(32,0,.Rook)]
    
    @Published var WhPlayerTakenPieces = [Piece]()
    var WPCounter: Int {
        var p_value = 0
        for piece in WhPlayerTakenPieces {
            p_value += piece.value()
        }
        return p_value }
    @Published var BlPlayerTakenPieces = [Piece]()
    
    var BPCounter: Int {
        var p_value = 0
        for piece in BlPlayerTakenPieces {
            p_value += piece.value()
        }
        return p_value }
    
    func checkPointsFor(player: Int) -> Int {
        if player == 1 {
            var p_value = 0
            for piece in WhPlayerTakenPieces {
                p_value += piece.value()
            }
            return p_value
        } else {
            var p_value = 0
            for piece in BlPlayerTakenPieces {
                p_value += piece.value()
            }
            return p_value
        }
    }
    
    @Published var GameState: [Int] =
        [0,1,2,3,4,5,6,7,
         8,9,10,11,12,13,14,15,
         48,49,50,51,52,53,54,55,
         56,57,58,59,60,61,62,63]
    
    @Published var ChosenPieceID: Int = 0
    @Published var isPicked = false
    @Published var ChosenHolder = 0
    @Published var PossibleMoves = [Int]()
    @Published var showPromotion = false
    

    @Published var PiecesRelations = [(Int,Relation,Int)]()
    

    func Assess(_ of: Int) -> MovesRange {
        print("White Relations")
        for a in PiecesRelations {
            if a.0 < 17 {
                print(a.0.description+" "+RelationSign[a.1]!+" "+a.2.description)
            }
        }
        print("Black Relations")
        for a in PiecesRelations {
            if a.0 > 16 {
                print(a.0.description+" "+RelationSign[a.1]!+" "+a.2.description)
            }
        }
        
        if !isPinned2(of) {
            return .free
        } else {
            return .restricted
        }
    }
    
    func isThreatened2(_ p_ID: Int) -> Bool {
        return PiecesRelations.contains(where: {$0.0 == ChosenPieceID  && $0.2 == p_ID && ($0.1 == .capture_threat || $0.1 == .mutual_capture_threat || $0.1 == .pin_with_mutual_capture_threat) })
    }
    
    
    func isPinned2(_ p_ID: Int) -> Bool {
        return PiecesRelations.contains(where: { $0.0 == ChosenPieceID  && $0.2 == p_ID && ($0.1 == .pin || $0.1 == .pin_with_movement_possibility || $0.1 == .pin_with_mutual_capture_threat)})
    }
    
    func isPromoting(_ p_ID: Int) -> Bool {
        return PiecesRelations.contains(where: {$0.0 == p_ID && $0.2 == p_ID && $0.1 == .promotion})
    }
    
    func addPieceRelation(_ p_ID: Int, _ relation: Relation, _ to_piece: Int) -> Void {
        PiecesRelations.append((p_ID, relation, to_piece))
        
    }
    
    func alterPieceRelation(_ p_1: Int,_ p_2: Int,_ to_relation: Relation) -> Void {
        for index in 0..<PiecesRelations.count {
            if PiecesRelations[index].0 == p_1 && PiecesRelations[index].2 == p_2{
                PiecesRelations[index].1 = to_relation
            }
        }
    }
    
    func resetRelationsOf(_ p_ID: Int ) -> Void {
        PiecesRelations.removeAll(where: { $0.0 == p_ID })
        PiecesRelations.removeAll(where: { $0.2 == p_ID })
    }
    
    func removePieceRelation(_ p_ID: Int, _ relation: Relation, _ to_piece: Int) -> Void {
        PiecesRelations.removeAll(where: { $0.0 == p_ID })
    }
    
    func findPiecesRelated(to: Int) -> [Int] {
        var relatedPieces = [Int]()
        for Rel in PiecesRelations {
            if Rel.2 == to {
                relatedPieces.append(Rel.0)
            }
        }
        return relatedPieces
    }
    
    func findRelatedPieces(of: Int) -> [Int] {
        var relatedPieces = [Int]()
        for Rel in PiecesRelations {
            if Rel.0 == of {
                relatedPieces.append(Rel.2)
            }
        }
        return relatedPieces
    }
    
    func relationExist(_ of: Int, _ relation: Relation, _ to: Int) -> Bool {
        return PiecesRelations.contains(where: { $0.0 == of && $0.1 == relation && $0.2 == to })
    }
    
    func verifyCurrentRelations(_ p_ID: Int) -> Void {
        
        let breaks = breaksThePin(p_ID)
        
        if breaks.0 {
            PiecesRelations.removeAll(where: { $0.0 == breaks.1 && ($0.1 == .pin || $0.1 == .pin_with_movement_possibility || $0.1 == .pin_with_mutual_capture_threat )})
        }
        
        let relsOf = findRelatedPieces(of: p_ID)
        for rel_piece in relsOf {
            PiecesRelations.removeAll(where: { $0.0 == p_ID && $0.2 == rel_piece && $0.1 != .en_passant })
            if GameState[rel_piece-1] == 999 {
                PiecesRelations.removeAll(where: { $0.0 == rel_piece })
            }
        }
        
        let relsTo = findPiecesRelated(to: p_ID)
        for rel_piece in relsTo {
            PiecesRelations.removeAll(where: { $0.0 == rel_piece && $0.1 != .en_passant })
            PiecesRelations.removeAll(where: { $0.2 == rel_piece && $0.1 != .en_passant })
            if GameState[rel_piece-1] != 999 {
                PositionCheckFor(rel_piece)
            }
        }
    }
    
    func getProtectingPiecesIDs(_ of: Int) -> [Int] {
        var protectingPieces = [Int]()
        for Rel in PiecesRelations {
            if Rel.2 == of && Rel.1 == .protects {
                protectingPieces.append(Rel.0)
            }
        }
        return protectingPieces
    }
    
    func setRelation(_ of: Int, _ to: Int) -> Void {
        
        let rel = getRelation(of, to)
        if rel != .none && !relationExist(of,rel,to) {
            addPieceRelation(of,rel,to)
        }
        
        let rel2 = getRelation(to, of)
        if rel2 != .none && !relationExist(to,rel,of) {
            addPieceRelation(to,rel2,of)
        }
    }
    
    func getRelation(_ of: Int, _ to: Int) -> Relation{
        
        let thisPieceMoves = getPieceMovesFor(of)
        let thisPieceCoords = getHolderCoordsByPiece(of)
        
        let enemyKingP_ID = Pieces[of-1].color == 1 ? 29 : 5
        let myKing = Pieces[of-1].color == 1 ? 5 : 29
        
        let enemyPieceHolderID = getLocationByPieceID(to)
        
        var direction: (Int, Int) = (0,0)
        var iCanAttack = false
        
        if of == myKing {
            MOVES: for move in thisPieceMoves {
                if getHolderIDFromCoord(Coord(thisPieceCoords.rank+move.0, thisPieceCoords.file+move.1)) == 64 {
                    continue MOVES
                } else {
                    let hol_ID = getHolderIDFromCoord(Coord(thisPieceCoords.rank+move.0, thisPieceCoords.file+move.1))
                    if hol_ID == enemyPieceHolderID {
                        if isProtected(Holders[hol_ID].piece_ID) {
                            return .none
                        } else {
                            return .capture_threat
                        }
                    }
                }
            }
        }
        
        if isPawn(of) {
            MOVES: for move in thisPieceMoves {
                if move.1 != 0 {
                    if getHolderIDFromCoord(Coord(thisPieceCoords.rank+move.0, thisPieceCoords.file+move.1)) == 64 {
                        continue MOVES
                    } else {
                        let hol_ID = getHolderIDFromCoord(Coord(thisPieceCoords.rank+move.0, thisPieceCoords.file+move.1))
                        if hol_ID == enemyPieceHolderID {
                            direction = move
                            iCanAttack = true
                            break
                        }
                    }
                }
            }
        } else {
            if moveMultiplier(of){
                MOVES: for move in thisPieceMoves {
                    for x in 1...8 {
                        if getHolderIDFromCoord(Coord(thisPieceCoords.rank+(move.0*x), thisPieceCoords.file+(move.1*x))) == 64{
                            continue MOVES
                        } else {
                            let hol_ID = getHolderIDFromCoord(Coord(thisPieceCoords.rank+(move.0*x), thisPieceCoords.file+(move.1*x)))
                            if hol_ID == enemyPieceHolderID {
                                direction = move
                                iCanAttack = true
                                break
                            }
                        }
                    }
                }
            } else {
                MOVES: for move in thisPieceMoves {
                    if getHolderIDFromCoord(Coord(thisPieceCoords.rank+move.0, thisPieceCoords.file+move.1)) == 64 {
                        continue MOVES
                    } else {
                        let hol_ID = getHolderIDFromCoord(Coord(thisPieceCoords.rank+move.0, thisPieceCoords.file+move.1))
                        if hol_ID == enemyPieceHolderID {
                            direction = move
                            iCanAttack = true
                        }
                    }
                }
            }
        }

        
        if to == enemyKingP_ID && iCanAttack == true {
            return Relation.check
        }
        
        let enemyCanAttack = canCaptureMe(getPieceIDByLocation(locId: enemyPieceHolderID), of)
        let enemyCanMove = canMoveOnLine(getPieceIDByLocation(locId: enemyPieceHolderID),direction)
        
        let enemyPieceProtectsKing = isProtectingOnLine(Holders[enemyPieceHolderID].piece_ID,direction)
        
        if iCanAttack {
            if Moves.knight.contains(where: { $0 == direction }) {
                if !enemyCanMove && !enemyCanAttack {
                    return Relation.capture_threat
                } else if enemyCanMove && !enemyCanAttack{
                    return Relation.capture_threat
                } else if !enemyCanMove && enemyCanAttack{
                    return Relation.mutual_capture_threat
                } else if enemyCanMove && enemyCanAttack{
                    return Relation.mutual_capture_threat
                } else {
                    return .none
                }
            } else {
                if enemyPieceProtectsKing {
                    if !enemyCanMove && !enemyCanAttack {
                        return Relation.pin
                    } else if enemyCanMove && !enemyCanAttack{
                        return Relation.pin_with_movement_possibility
                    } else if !enemyCanMove && enemyCanAttack{
                        return Relation.pin_with_mutual_capture_threat
                    } else if enemyCanMove && enemyCanAttack{
                        return Relation.pin_with_mutual_capture_threat
                    } else {
                        return .none
                    }
                } else {
                    if !enemyCanMove && !enemyCanAttack {
                        return Relation.capture_threat
                    } else if enemyCanMove && !enemyCanAttack{
                        return Relation.capture_threat
                    } else if !enemyCanMove && enemyCanAttack{
                        return Relation.mutual_capture_threat
                    } else if enemyCanMove && enemyCanAttack{
                        return Relation.mutual_capture_threat
                    } else {
                        return .none
                    }
                }
            }
        } else {
            return .none
        }
    }
    
    func isProtectingOnLine(_ p_ID: Int, _ line: (Int,Int)) -> Bool {
        let thisPieceCoords = getHolderCoordsByPiece(p_ID)
        for x in 1...8 {
            if getHolderIDFromCoord(Coord(thisPieceCoords.rank+(line.0*x), thisPieceCoords.file+(line.1*x))) != 64 {
                let hol_ID = getHolderIDFromCoord(Coord(thisPieceCoords.rank+(line.0*x), thisPieceCoords.file+(line.1*x)))
                if isEnemyKingOnHolder(hol_ID) {
                    return true
                }
            } else {
                return false
            }
        }
        return false
    }
    
    func canMoveOnLine(_ p_ID: Int,_ dir: (Int, Int)) -> Bool {
        let moves = getPieceMovesFor(p_ID)
        let p_cords = getHolderCoordsByPiece(p_ID)
        
        if Moves.knight.contains(where: { $0 == dir }) {
            return true
        }
        
        if isPawn(p_ID){
            MOVES: for move in moves {
                if move == dir || move == inv_dir(dir) {
                    if (move.1 == 0){
                        if getHolderIDFromCoord(Coord(p_cords.rank+move.0, p_cords.file+move.1)) == 64 {
                            break
                        } else {
                            let hol_ID = getHolderIDFromCoord(Coord(p_cords.rank+move.0, p_cords.file+move.1))
                            if Holders[hol_ID].piece_ID == 0 {
                                return true
                            } else {
                                return false
                            }
                        }
                    }
                } else {
                    continue MOVES
                }
            }
        } else {
            MOVES: for move in moves {
                if move == dir || move == inv_dir(dir) {
                    if moveMultiplier() {
                        for x in 1...8 {
                            if getHolderIDFromCoord(Coord(p_cords.rank+(move.0*x), p_cords.file+(move.1*x))) == 64{
                                continue MOVES
                            } else {
                                let hol_ID = getHolderIDFromCoord(Coord(p_cords.rank+(move.0*x), p_cords.file+(move.1*x)))
                                if Holders[hol_ID].piece_ID == 0 {
                                    return true
                                } else {
                                    return false
                                }
                            }
                        }
                    } else {
                        if getHolderIDFromCoord(Coord(p_cords.rank+(move.0), p_cords.file+(move.1))) == 64{
                            continue MOVES
                        } else {
                            let hol_ID = getHolderIDFromCoord(Coord(p_cords.rank+(move.0), p_cords.file+(move.1)))
                            if Holders[hol_ID].piece_ID == 0 {
                                return true
                            } else {
                                return false
                            }
                        }
                    }
                } else {
                    continue MOVES
                }
            }
        }
        return false
    }
    
    func canCaptureMe(_ p_ID: Int, _ px_ID: Int) -> Bool {
        let moves = getPieceMovesFor(p_ID)
        let p_cords = getHolderCoordsByPiece(p_ID)
                
        if isPawn(p_ID){
            MOVES: for move in moves {
                if (move.1 != 0){
                    if getHolderIDFromCoord(Coord(p_cords.rank+move.0, p_cords.file+move.1)) == 64 {
                        continue MOVES
                    }
                    let hol_ID = getHolderIDFromCoord(Coord(p_cords.rank+move.0, p_cords.file+move.1))
                    if Holders[hol_ID].piece_ID == px_ID {
                        return true
                    }
                }
            }
        } else {
            MOVES: for move in moves {
                if moveMultiplier() {
                    for x in 1...8 {
                        if getHolderIDFromCoord(Coord(p_cords.rank+(move.0*x), p_cords.file+(move.1*x))) == 64{
                            continue MOVES
                        } else {
                            let hol_ID = getHolderIDFromCoord(Coord(p_cords.rank+(move.0*x), p_cords.file+(move.1*x)))
                            if Holders[hol_ID].piece_ID == px_ID {
                                return true
                            }
                        }
                    }
                } else {
                    if getHolderIDFromCoord(Coord(p_cords.rank+(move.0), p_cords.file+(move.1))) == 64{
                        continue MOVES
                    } else {
                        let hol_ID = getHolderIDFromCoord(Coord(p_cords.rank+(move.0), p_cords.file+(move.1)))
                        if Holders[hol_ID].piece_ID == px_ID {
                            return true
                        }
                    }
                }
            }
        }
        return false
    }
    
    func isAttackedBy() -> [Int] {
        let myPiece = ChosenPieceID
        let myPieceHolderID = getLocationByPieceID(myPiece)
        let thisPieceCoords = getHolderCoordsByPiece(myPiece)
        
        var Attackers: [Int] = []
        
        MOVES: for move in Moves.queen {
            for x in 1...8 {
                if getHolderIDFromCoord(Coord(thisPieceCoords.rank+(move.0*x), thisPieceCoords.file+(move.1*x))) == 64{
                    continue MOVES
                } else {
                    let hol_ID = getHolderIDFromCoord(Coord(thisPieceCoords.rank+(move.0*x), thisPieceCoords.file+(move.1*x)))
                    if Holders[hol_ID].piece_ID > 0 {
                        if isEnemyPieceOnHolder(hol_ID) {
                            let enemyCanAttack = getAttackedHoldersOfPiece(getPieceIDByLocation(locId: hol_ID)).contains(where: {$0 == myPieceHolderID})
                            if enemyCanAttack {
                                Attackers.append(Holders[hol_ID].piece_ID)
                                continue MOVES
                            }
                        }
                    }
                }
            }
        }

        MOVES2: for move in Moves.knight {
            if getHolderIDFromCoord(Coord(thisPieceCoords.rank+move.0, thisPieceCoords.file+move.1)) == 64 {
                continue MOVES2
            } else {
                let hol_ID = getHolderIDFromCoord(Coord(thisPieceCoords.rank+move.0, thisPieceCoords.file+move.1))
                if Holders[hol_ID].piece_ID > 0 {
                    if isEnemyPieceOnHolder(hol_ID) {
                        let p_at = Holders[hol_ID].piece_ID
                        let enemyCanAttack = getAttackedHoldersOfPiece(p_at).contains(where: {$0 == myPieceHolderID})
                        if enemyCanAttack {
                            Attackers.append(Holders[hol_ID].piece_ID)
                            continue MOVES2
                        }
                    }
                }
            }
        }
        
        return Attackers
    }
    
    func breaksThePin(_ p_ID: Int) -> (Bool, Int) {

        for pin in PiecesRelations {
            if pin.1 == .pin || pin.1 == .pin_with_movement_possibility || pin.1 == .pin_with_mutual_capture_threat {
                let line = PinDirectionOf(pin.0)
                let thisPieceCoords = getHolderCoordsByPiece(pin.0)
                for x in 1...8 {
                    if getHolderIDFromCoord(Coord(thisPieceCoords.rank+(line.0*x), thisPieceCoords.file+(line.1*x))) != 64 {
                        let hol_ID = getHolderIDFromCoord(Coord(thisPieceCoords.rank+(line.0*x), thisPieceCoords.file+(line.1*x)))
                        if hol_ID == getHolderIdByPieceId(p_ID) {
                            return (true, pin.0)
                        }
                    }
                }
                return (false, 0)
            }
        }
        
        return (false, 0)
    }
    
    func isSafeSquare(_ hol_ID: Int) -> Bool {
        
        let thisPieceCoords = Coordinates[hol_ID]
                
        MOVES: for move in Moves.queen {
            for x in 1...8 {
                if getHolderIDFromCoord(Coord(thisPieceCoords.rank+(move.0*x), thisPieceCoords.file+(move.1*x))) == 64{
                    continue MOVES
                } else {
                     let hol_ID2 = getHolderIDFromCoord(Coord(thisPieceCoords.rank+(move.0*x), thisPieceCoords.file+(move.1*x)))
                    if Holders[hol_ID2].piece_ID > 0 {
                        if isEnemyPieceOnHolder(hol_ID2) {
                            let p_t = Pieces[Holders[hol_ID2].piece_ID-1].piece_type
                            if p_t == .wPawn || p_t == .bPawn {
                                if getPossiblePawnAttacks(Holders[hol_ID2].piece_ID).contains(where: {$0 == hol_ID}) {
                                    return false
                                }
                            } else {
                                if getPossiblePiecesMoves(Holders[hol_ID2].piece_ID).contains(where: {$0 == hol_ID}) {
                                    return false
                                }
                            }
                        }
                    }
                }
            }
        }

        MOVES2: for move in Moves.knight {
            if getHolderIDFromCoord(Coord(thisPieceCoords.rank+move.0, thisPieceCoords.file+move.1)) == 64 {
                continue MOVES2
            } else {
                let hol_ID = getHolderIDFromCoord(Coord(thisPieceCoords.rank+move.0, thisPieceCoords.file+move.1))
                if Holders[hol_ID].piece_ID > 0 {
                    if isEnemyPieceOnHolder(hol_ID) {
                        let p_at = Holders[hol_ID].piece_ID
                        if getAttackedHoldersOfPiece(p_at).contains(where: {$0 == hol_ID}) {
                            return false
                        }
                    }
                }
            }
        }
        return true
    }
    
    func isProtected(_ p_ID: Int) -> Bool {
        let thisPieceCoords = getHolderCoordsByPiece(p_ID)
                
        var protectingPawns: [Int] = []
        var protectingPieces: [Int] = []
        
        MOVES: for move in Moves.queen {
            for x in 1...8 {
                if getHolderIDFromCoord(Coord(thisPieceCoords.rank+(move.0*x), thisPieceCoords.file+(move.1*x))) == 64{
                    continue MOVES
                } else {
                    let hol_ID = getHolderIDFromCoord(Coord(thisPieceCoords.rank+(move.0*x), thisPieceCoords.file+(move.1*x)))
                    if Holders[hol_ID].piece_ID > 0 {
                        if isEnemyPieceOnHolder(hol_ID) {
                            let prot_piece = Holders[hol_ID].piece_ID
                            
                            if x == 1 && isPawn(prot_piece){
                                if move.1 != 0 && !isPinned2(prot_piece) {
                                    protectingPawns.append(prot_piece)
                                }
                            } else {
                                if canMoveOnLine(prot_piece, move){
                                    protectingPieces.append(prot_piece)
                                }
                            }
                            
                        }
                    }
                }
            }
        }
        
        
        MOVES2: for move in Moves.knight {
            if getHolderIDFromCoord(Coord(thisPieceCoords.rank+move.0, thisPieceCoords.file+move.1)) == 64 {
                continue MOVES2
            } else {
                let hol_ID = getHolderIDFromCoord(Coord(thisPieceCoords.rank+move.0, thisPieceCoords.file+move.1))
                if Holders[hol_ID].piece_ID > 0 {
                    if isEnemyPieceOnHolder(hol_ID) {
                        let prot_piece = Holders[hol_ID].piece_ID
                        if Pieces[prot_piece-1].piece_type == .Knight && !isPinned2(prot_piece){
                            protectingPieces.append(prot_piece)
                        }
                    }
                }
            }
        }
        if !protectingPawns.isEmpty || !protectingPieces.isEmpty {
            return true
        }
        return false
    }
    
    func canSaveKing(_ p_ID: Int) -> Bool {
        
        let king = Pieces[p_ID-1].color == 1 ? 29 : 5
        
        if p_ID == king {
            let possible_holders = getPossiblePiecesMoves(p_ID)
            
            for poss_hol in possible_holders {
                if isSafeSquare(poss_hol) {
                    return true
                }
            }
            
        } else {
            
        }
        
        
        let checksFrom = getPiecesCheckingMyKing(p_ID)
        
        for piece in checksFrom {
            let line = PinDirectionOf(piece)
            let thisPieceCoords = getHolderCoordsByPiece(piece)
            for x in 1...8 {
                if getHolderIDFromCoord(Coord(thisPieceCoords.rank+(line.0*x), thisPieceCoords.file+(line.1*x))) != 64 {
                    let hol_ID = getHolderIDFromCoord(Coord(thisPieceCoords.rank+(line.0*x), thisPieceCoords.file+(line.1*x)))
                    if hol_ID == getHolderIdByPieceId(p_ID) {
                        return true
                    }
                }
            }
            return false
        }
        
        return false
        
    }
    
    func CheckKingsProtection() -> Void {
        let kings = [5,29]
        
        for king in kings {
            
            let kingCoords = getHolderCoordsByPiece(king)
            
            let relatedPieces = findPiecesRelated(to: king)
            
            MOVES: for move in Moves.queen {
                for x in 1...8 {
                    if getHolderIDFromCoord(Coord(kingCoords.rank+(move.0*x), kingCoords.file+(move.1*x))) == 64 {
                        continue MOVES
                    } else {
                        let hol_ID = getHolderIDFromCoord(Coord(kingCoords.rank+(move.0*x), kingCoords.file+(move.1*x)))
                        if Holders[hol_ID].piece_ID > 0 {
                            if Pieces[king-1].color == Pieces[Holders[hol_ID].piece_ID - 1].color {
                                if !relatedPieces.contains(where: {$0 == Holders[hol_ID].piece_ID }){
                                    
                                    continue MOVES
                                }
                            }
                        } else if Holders[hol_ID].piece_ID == 0 {
                            break
                        }
                    }
                }
            }
        }
    }
    
    func getPiecesCheckingMyKing(_ p_ID: Int) -> [Int] {
        
        let king = Pieces[p_ID-1].color == 1 ? 29 : 5
        
        var Checks: [Int] = []
        
        for rel in PiecesRelations {
            if rel.1 == .check && rel.2 == king {
                Checks.append(rel.0)
            }
        }
        return Checks
    }
    
    
    
    func set() -> Void {
        for index in 0..<GameState.count {
            
            Holders[GameState[index]].piece_ID = index+1
        }
    }
    
    func put() -> Void {
        
        
        if(PossibleMoves.contains(Holders[ChosenHolder].id)){
            
            enPassantCheck()
            
            hidePossibileMoves()
            
            Holders[GameState[ChosenPieceID-1]].piece_ID = 0
            
            GameState[ChosenPieceID-1] = ChosenHolder
            
            Holders[ChosenHolder].piece_ID = ChosenPieceID
            
            promotionCheck()
            
            verifyCurrentRelations(ChosenPieceID)
            
            PositionCheck()
            
            ChosenPieceID = 0
            ChosenHolder = 0
            isPicked = false
        }
    }
    
    func Attack(_ p_ID: Int) -> Void {
        if((isThreatened2(p_ID) || isPinned2(p_ID)) && isEnemyPiece(p_ID)){
            
            if Pieces[p_ID-1].color == 0 {
                WhPlayerTakenPieces.append(Pieces[p_ID-1])
            } else {
                BlPlayerTakenPieces.append(Pieces[p_ID-1])
            }
            
            Holders[getLocationByPieceID(ChosenPieceID)].piece_ID = 0
            
            GameState[ChosenPieceID-1] = getLocationByPieceID(p_ID)
            
            Holders[getLocationByPieceID(p_ID)].piece_ID = ChosenPieceID
            
            GameState[p_ID-1] = 999
            
            promotionCheck()
            
            verifyCurrentRelations(ChosenPieceID)
            
            PositionCheck()

            ChosenPieceID = 0
            ChosenHolder = 0
            hidePossibileMoves()
            isPicked = false
        }
    }
    
    func getPieceIDByLocation(locId: Int) -> Int {
        for p_ID in 0..<GameState.count {
            if GameState[p_ID] == locId{
                
                return p_ID+1
            }
        }
        return 0
    }
    
    func getHolderIDFromCoord(_ c: Coord) -> Int {
        for h_ID in 0..<Coordinates.count {
            if Coordinates[h_ID] == c {
                
                return h_ID
            }
        }
        return 64
    }
    
    func getHolderCoordsByPiece(_ p_ID: Int) -> Coord {
        return Coordinates[GameState[p_ID-1]]
    }
    
    func getLocationByPieceID(_ p_ID: Int) -> Int {
        return GameState[p_ID-1]
    }
    
    func isEnemyPiece(_ p_ID: Int) -> Bool {
        return Pieces[p_ID-1].color != Pieces[ChosenPieceID-1].color
    }
    
    func isEnemyPieceOnHolder(_ h_ID: Int) -> Bool {
        if Holders[h_ID].piece_ID > 0 {
        return Pieces[Holders[h_ID].piece_ID-1].color != Pieces[ChosenPieceID-1].color
        } else {
            return false
        }
    }
    
    func isEnemyPieceOnHolderFor(_ h_ID: Int, _ p_ID: Int) -> Bool {
        return Pieces[Holders[h_ID].piece_ID-1].color != Pieces[p_ID-1].color
    }
    
    func isFriendlyPieceOnHolder(_ h_ID: Int) -> Bool {
        if Holders[h_ID].piece_ID > 0 {
        return Pieces[Holders[h_ID].piece_ID-1].color == Pieces[ChosenPieceID-1].color
        } else {
            return false
        }
    }
    
    func isEnemyPawnPushMove(_ move: (Int, Int)) -> Bool {
        let enemyColor = Pieces[ChosenPieceID-1].color == 1 ? 0 : 1
        if enemyColor == 0 {
            return Moves.bpawn.first! == move
        } else {
            return Moves.wpawn.first! == move
        }
    }
    
    func inv_dir(_ dir: (Int, Int)) -> (Int, Int){
        return (dir.0 * -1,dir.1 * -1)
    }
    
    func PositionCheck() -> Void {
        
        
        let thisPieceCoords = getHolderCoordsByPiece(ChosenPieceID)
        let thisPieceMoves = getPieceMovesFor(ChosenPieceID)
        
        var relatedPieces: [Int] = []
        
        if isPawn() {
            MOVES: for move in thisPieceMoves {
                if move.1 != 0 {
                    if getHolderIDFromCoord(Coord(thisPieceCoords.rank+move.0, thisPieceCoords.file+move.1)) == 64 {
                        continue MOVES
                    } else {
                        let hol_ID = getHolderIDFromCoord(Coord(thisPieceCoords.rank+move.0, thisPieceCoords.file+move.1))
                        
                        if Holders[hol_ID].piece_ID > 0 {
                            if isEnemyPiece(Holders[hol_ID].piece_ID) {
                                relatedPieces.append(Holders[hol_ID].piece_ID)
                                continue MOVES
                            } else if !isEnemyPiece(Holders[hol_ID].piece_ID) {
                                continue MOVES
                            }
                        }
                    }
                }
            }
        } else {
            MOVES: for move in thisPieceMoves {
                if(moveMultiplier()){
                    for x in 1...8 {
                        if getHolderIDFromCoord(Coord(thisPieceCoords.rank+(move.0*x), thisPieceCoords.file+(move.1*x))) == 64 {
                            continue MOVES
                        } else {
                            let hol_ID = getHolderIDFromCoord(Coord(thisPieceCoords.rank+(move.0*x), thisPieceCoords.file+(move.1*x)))
                            
                            if Holders[hol_ID].piece_ID > 0 {
                                if isEnemyPiece(Holders[hol_ID].piece_ID) {
                                    relatedPieces.append(Holders[hol_ID].piece_ID)
                                    continue MOVES
                                } else if !isEnemyPiece(Holders[hol_ID].piece_ID) {
                                    continue MOVES
                                }
                            }
                        }
                    }
                } else {
                    if getHolderIDFromCoord(Coord(thisPieceCoords.rank+move.0, thisPieceCoords.file+move.1)) == 64 {
                        continue MOVES
                    } else {
                        let hol_ID = getHolderIDFromCoord(Coord(thisPieceCoords.rank+move.0, thisPieceCoords.file+move.1))
                        
                        if Holders[hol_ID].piece_ID > 0 {
                            if isEnemyPiece(Holders[hol_ID].piece_ID) {
                                relatedPieces.append(Holders[hol_ID].piece_ID)
                                continue MOVES
                            } else if !isEnemyPiece(Holders[hol_ID].piece_ID) {
                                continue MOVES
                            }
                        }
                    }
                }
            }
        }
        
        let otherAttackingPieces = isAttackedBy()
            
        let allRelatedPieces = Array(Set(relatedPieces + otherAttackingPieces))
        
        for P in allRelatedPieces {
            setRelation(ChosenPieceID, P)
        }
    }
    
    func PositionCheckFor(_ p_ID: Int) -> Void {
        let thisPieceCoords = getHolderCoordsByPiece(p_ID)
        let thisPieceMoves = getSpecificPieceMoves(p_ID)
        
        MOVES: for move in thisPieceMoves {
            if(moveMultiplier(p_ID)){
                for x in 1...8 {
                    if getHolderIDFromCoord(Coord(thisPieceCoords.rank+(move.0*x), thisPieceCoords.file+(move.1*x))) == 64 {
                        continue MOVES
                    } else {
                        let hol_ID = getHolderIDFromCoord(Coord(thisPieceCoords.rank+(move.0*x), thisPieceCoords.file+(move.1*x)))
                        
                        if Holders[hol_ID].piece_ID > 0 {
                            if isEnemyPieceOnHolderFor(hol_ID, p_ID) {
                                ChosenPieceID = p_ID
                                setRelation(p_ID, Holders[hol_ID].piece_ID)
                                continue MOVES
                            } else if !isEnemyPiece(Holders[hol_ID].piece_ID) {
                                continue MOVES
                            }
                        }
                    }
                }
            } else {
                if getHolderIDFromCoord(Coord(thisPieceCoords.rank+move.0, thisPieceCoords.file+move.1)) == 64 {
                    continue MOVES
                } else {
                    let hol_ID = getHolderIDFromCoord(Coord(thisPieceCoords.rank+move.0, thisPieceCoords.file+move.1))
                    
                    if Holders[hol_ID].piece_ID > 0 {
                        if isEnemyPieceOnHolderFor(hol_ID, p_ID) {
                            setRelation(p_ID, Holders[hol_ID].piece_ID)
                            continue MOVES
                        } else if !isEnemyPiece(Holders[hol_ID].piece_ID) {
                            continue MOVES
                        }
                    }
                }
            }
        }
    }
    
    func getAttackedHoldersOfPiece(_ p_ID: Int) -> [Int] {
        if Pieces[p_ID-1].piece_type == .bPawn || Pieces[p_ID-1].piece_type == .wPawn {
            return getPossiblePawnMoves(p_ID)
        } else {
            return getPossiblePiecesMoves(p_ID)
        }
    }
    
    func enPassantCheck() -> Void {
        
        if Pieces[ChosenPieceID-1].piece_type == .wPawn || Pieces[ChosenPieceID-1].piece_type == .bPawn {
            
            if (getHolderCoordsByPiece(ChosenPieceID).rank == 1 && Pieces[ChosenPieceID-1].piece_type == .wPawn) || ( getHolderCoordsByPiece(ChosenPieceID).rank == 6 && Pieces[ChosenPieceID-1].piece_type == .bPawn) {
                if PossibleMoves.first != ChosenHolder {
                    
                    addPieceRelation(ChosenPieceID, .en_passant , ChosenPieceID)
                }
                
            } else if (Coordinates[Holders[ChosenHolder].id].file != Coordinates[GameState[ChosenPieceID-1]].file){
                let mod = Pieces[ChosenPieceID-1].piece_type == .bPawn ? 1 : -1
                let hol_ID2 = getHolderIDFromCoord(Coord(Coordinates[Holders[ChosenHolder].id].rank+mod,Coordinates[Holders[ChosenHolder].id].file))
                let p_ID = Holders[hol_ID2].piece_ID
                if Holders[hol_ID2].piece_ID != 0 && Holders[hol_ID2].piece_ID != 999 && hol_ID2 != 64{
                    if isEnpassantable2(p_ID) && isEnemyPieceOnHolder(hol_ID2){
                        
                        Holders[hol_ID2].piece_ID = 0
                        
                        GameState[p_ID-1] = 999
                    }
                }
            }
        }
    }
    
    func isEnpassantable2(_ p_ID: Int) -> Bool {
        return PiecesRelations.contains(where: {$0.0 == p_ID && $0.1 == .en_passant && $0.2 == p_ID})
    }
    
    func getPawnToPromote() -> Int {
        let promotionSquares = [0,1,2,3,4,5,6,7,56,57,58,59,60,61,62,63]
        let WPawns = [9,10,11,12,13,14,15,16]
        let BPawns = [17,18,19,20,21,22,23,24]
        
        for PromSqr in promotionSquares {
            if PromSqr < 8 {
                for Pawn_ID in BPawns {
                    if Holders[PromSqr].piece_ID == Pawn_ID {
                        return Pawn_ID
                    }
                }
            } else {
                for Pawn_ID in WPawns {
                    if Holders[PromSqr].piece_ID == Pawn_ID {
                        return Pawn_ID
                    }
                }
            }
        }
        return 999
    }
    
    func getPromotedPawn()-> Int {
        for p_ID in 0..<Pieces.count {
            if Pieces[p_ID].STATE() == .promotion{
                
                return p_ID + 1
            }
        }
        return 999
    }
    
    func promoteTo(_ to: PieceTypes) -> Void {
        let p_ID = getPawnToPromote()
        if p_ID != 999 {
            Pieces[p_ID-1].piece_type = to
            
            PositionCheckFor(p_ID)
        }
    }
    
    func promotionCheck() -> Void {
        if Pieces[ChosenPieceID-1].piece_type == .bPawn && Coordinates[getLocationByPieceID(ChosenPieceID)].rank ==  0 {
            Pieces[ChosenPieceID-1].addRelation(ChosenPieceID, .promotion)
            addPieceRelation(ChosenPieceID, .promotion , ChosenPieceID)
            showPromotion = true
        } else if Pieces[ChosenPieceID-1].piece_type == .wPawn && Coordinates[getLocationByPieceID(ChosenPieceID)].rank ==  7 {
            Pieces[ChosenPieceID-1].addRelation(ChosenPieceID, .promotion)
            addPieceRelation(ChosenPieceID, .promotion , ChosenPieceID)
            showPromotion = true
        }
    }
    
    
    
    func getPieceMoves() -> [(Int,Int)] {
        switch Pieces[ChosenPieceID-1].piece_type {
        case .wPawn:
            if getHolderCoordsByPiece(ChosenPieceID).rank < 2 {
                return Moves.wpawn+[(2,0)]
            } else {
                return Moves.wpawn
            }
        case .bPawn:
            if getHolderCoordsByPiece(ChosenPieceID).rank > 5 {
                return Moves.bpawn+[(-2,0)]
            } else {
                return Moves.bpawn
            }
        case .Knight:
            return Moves.knight
        case .Bishop:
            return Moves.bishop
        case .Rook:
            return Moves.rook
        case .Queen:
            return Moves.queen
        case .King:
            return Moves.king
        }
    }
    
    func getPieceMovesFor(_ p_ID: Int) -> [(Int,Int)] {
        switch Pieces[p_ID-1].piece_type {
        case .wPawn:
            if getHolderCoordsByPiece(p_ID).rank < 2 {
                return Moves.wpawn+[(2,0)]
            } else {
                return Moves.wpawn
            }
        case .bPawn:
            if getHolderCoordsByPiece(p_ID).rank > 5 {
                return Moves.bpawn+[(-2,0)]
            } else {
                return Moves.bpawn
            }
        case .Knight:
            return Moves.knight
        case .Bishop:
            return Moves.bishop
        case .Rook:
            return Moves.rook
        case .Queen:
            return Moves.queen
        case .King:
            return Moves.king
        }
    }
    
    func getSpecificPieceMoves(_ p_ID: Int) -> [(Int,Int)] {
        switch Pieces[p_ID-1].piece_type {
        case .wPawn:
            var moves: [(Int,Int)] = []
            moves.append(Moves.bpawn.first!)
            return moves
        case .bPawn:
            var moves: [(Int,Int)] = []
            moves.append(Moves.bpawn.first!)
            return moves
        case .Knight:
            return Moves.knight
        case .Bishop:
            return Moves.bishop
        case .Rook:
            return Moves.rook
        case .Queen:
            return Moves.queen
        case .King:
            return Moves.king
        }
    }
    
    func PinDirection() -> (Int, Int) {
        let KingID = Pieces[ChosenPieceID-1].color == 1 ? 5 : 29
        let KingH_ID = getLocationByPieceID(KingID)
        let PieceH_ID = getLocationByPieceID(ChosenPieceID)
        
        if Coordinates[KingH_ID].file == Coordinates[PieceH_ID].file {
            if Coordinates[KingH_ID].rank > Coordinates[PieceH_ID].rank {
                return (-1,0)
            } else {
                return (1,0)
            }
        } else if Coordinates[KingH_ID].rank == Coordinates[PieceH_ID].rank {
            if Coordinates[KingH_ID].file > Coordinates[PieceH_ID].file {
                return (0,-1)
            } else {
                return (0,1)
            }
        } else {
            let f_x = Coordinates[KingH_ID].file - Coordinates[PieceH_ID].file
            let r_x = Coordinates[KingH_ID].rank - Coordinates[PieceH_ID].rank
            
            return (r_x.signum(),f_x.signum())
            
        }
    }
    
    func PinDirectionOf(_ p_ID: Int) -> (Int, Int) {
        let KingID = Pieces[p_ID-1].color == 1 ? 29 : 5
        let KingH_ID = getLocationByPieceID(KingID)
        let PieceH_ID = getLocationByPieceID(p_ID)
        
        if Coordinates[KingH_ID].file == Coordinates[PieceH_ID].file {
            if Coordinates[KingH_ID].rank > Coordinates[PieceH_ID].rank {
                return (-1,0)
            } else {
                return (1,0)
            }
        } else if Coordinates[KingH_ID].rank == Coordinates[PieceH_ID].rank {
            if Coordinates[KingH_ID].file > Coordinates[PieceH_ID].file {
                return (0,-1)
            } else {
                return (0,1)
            }
        } else {
            let f_x = Coordinates[KingH_ID].file - Coordinates[PieceH_ID].file
            let r_x = Coordinates[KingH_ID].rank - Coordinates[PieceH_ID].rank
            
            return (r_x.signum(),f_x.signum())
            
        }
    }
    
    func isPawn() -> Bool {
        let pawnColor = Pieces[ChosenPieceID-1].color
        if pawnColor == 1 {
            if Pieces[ChosenPieceID-1].piece_type == .wPawn {
                return true
            }
        } else {
            if Pieces[ChosenPieceID-1].piece_type == .bPawn {
                return true
            }
        }
        return false
    }
    
    func isPawn(_ p_ID: Int) -> Bool {
        let pawnColor = Pieces[p_ID-1].color
        if pawnColor == 1 {
            if Pieces[p_ID-1].piece_type == .wPawn {
                return true
            }
        } else {
            if Pieces[p_ID-1].piece_type == .bPawn {
                return true
            }
        }
        return false
    }
    
    func isEnemyKing(_ p_ID: Int) -> Bool {
        if isEnemyPiece(ChosenPieceID){
            let enKingID = Pieces[ChosenPieceID-1].color == 1 ? 29 : 5
            if p_ID == enKingID {
                return true
            } else {
                return false
            }
        }
        return false
    }
    
    func isEnemyKingOnHolder(_ h_ID: Int) -> Bool {
        let enKingID = Pieces[ChosenPieceID-1].color == 1 ? 29 : 5
        return Holders[h_ID].piece_ID == enKingID
    }
    
    func kingInCheck() -> Bool {
        let KingID = Pieces[ChosenPieceID-1].color == 1 ? 5 : 29
        return Pieces[KingID-1].piece_state == .in_check
    }
    
    func kingInDoubleCheck() -> Bool {
        let KingID = Pieces[ChosenPieceID-1].color == 1 ? 5 : 29
        return Pieces[KingID-1].piece_state == .double_check
    }
    
    func showPossibleKingMoves() -> Void {
        
        let moves = getPieceMoves()
        let holderCoords = getHolderCoordsByPiece(ChosenPieceID)
        
        var possibleHoldersIDs: [Int] = []
        let piece_state = Assess(ChosenPieceID)

        if piece_state == .restricted {
            let dir = inv_dir(PinDirection())
            MOVES: for move in moves {
                if move == dir {
                    continue MOVES
                }
                if getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1)) != 64 {
                    
                    let hol_ID = getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1))
                    
                    if Holders[hol_ID].piece_ID > 0 && Holders[hol_ID].piece_ID != 999 {
                        
                        if isEnemyPieceOnHolder(hol_ID) && !isProtected(Holders[hol_ID].piece_ID) {
                            
                            possibleHoldersIDs.append(hol_ID)
                        }
                    } else if Holders[hol_ID].piece_ID == 0 && isSafeSquare(hol_ID) {
                        possibleHoldersIDs.append(hol_ID)
                    }
                }
            }
            PossibleMoves = possibleHoldersIDs
        } else if piece_state == .free {
            for move in moves {
                if getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1)) != 64 {
                    
                    let hol_ID = getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1))
                    
                    if Holders[hol_ID].piece_ID > 0 && Holders[hol_ID].piece_ID != 999 {
                        
                        if isEnemyPieceOnHolder(hol_ID) && !isProtected(Holders[hol_ID].piece_ID){
                            
                            possibleHoldersIDs.append(hol_ID)
                        }
                    } else if Holders[hol_ID].piece_ID == 0 && isSafeSquare(hol_ID) {
                        possibleHoldersIDs.append(hol_ID)
                    }
                }
            }
            PossibleMoves = possibleHoldersIDs
        } else {
            PossibleMoves = possibleHoldersIDs
        }
    }
    
    func getPossiblePawnMoves(_ p_ID: Int) -> [Int] {
        let moves = getPieceMovesFor(p_ID)
        let holderCoords = getHolderCoordsByPiece(p_ID)
        var possibleHoldersIDs: [Int] = []
        MOVES: for move in moves {
            
            if (move.1 != 0){
                if getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1)) == 64 {
                    continue MOVES
                } else {
                    let hol_ID = getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1))
                    
                    if Holders[hol_ID].piece_ID != 0 && Holders[hol_ID].piece_ID != 999{
                        
                        if isEnemyPieceOnHolder(hol_ID) {
                            
                            possibleHoldersIDs.append(hol_ID)
                        }
                        
                    } else if Holders[hol_ID].piece_ID == 0 {
                        let mod = Pieces[ChosenPieceID-1].piece_type == .bPawn ? 1 : -1
                        if getHolderIDFromCoord(Coord(holderCoords.rank+move.0+mod, holderCoords.file+move.1)) == 64 {
                            continue MOVES
                        } else {
                            let hol_ID2 = getHolderIDFromCoord(Coord(holderCoords.rank+move.0+mod, holderCoords.file+move.1))
                            let p_ID = Holders[hol_ID2].piece_ID
                            if Holders[hol_ID2].piece_ID != 0 && Holders[hol_ID2].piece_ID != 999 {
                                if Pieces[p_ID-1].piece_state == .en_passantable && isEnemyPieceOnHolder(hol_ID2){
                                    
                                    possibleHoldersIDs.append(hol_ID)
                                }
                            }
                        }
                    }
                }
            } else {
                if getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1)) == 64 {
                    continue MOVES
                } else {
                    let hol_ID = getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1))
                    
                    if Holders[hol_ID].piece_ID == 0 {
                        
                        possibleHoldersIDs.append(hol_ID)
                    } else {
                        break
                    }
                }
            }
        }
        return possibleHoldersIDs
    }
    
    func getPossiblePawnMovesAndAttacks(_ p_ID: Int) -> [Int] {
        let moves = getPieceMovesFor(p_ID)
        let holderCoords = getHolderCoordsByPiece(p_ID)
        var possibleHoldersIDs: [Int] = []
        MOVES: for move in moves {
            
            if (move.1 != 0){
                if getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1)) == 64 {
                    continue MOVES
                } else {
                    let hol_ID = getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1))
                    
                    if Holders[hol_ID].piece_ID != 999{
                        
                        if isEnemyPieceOnHolder(hol_ID) {
                            
                            possibleHoldersIDs.append(hol_ID)
                        }
                        
                    } else if Holders[hol_ID].piece_ID == 0 {
                        possibleHoldersIDs.append(hol_ID)













                    }
                }
            } else {
                if getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1)) == 64 {
                    continue MOVES
                } else {
                    let hol_ID = getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1))
                    
                    if Holders[hol_ID].piece_ID == 0 {
                        
                        possibleHoldersIDs.append(hol_ID)
                    } else {
                        break
                    }
                }
            }
        }
        return possibleHoldersIDs
    }
    
    func getPossiblePawnAttacks(_ p_ID: Int) -> [Int] {
        let moves = getPieceMovesFor(p_ID)
        let holderCoords = getHolderCoordsByPiece(p_ID)
        var possibleHoldersIDs: [Int] = []
        let piece_state = Assess(p_ID)
        if piece_state == .free {
            for move in moves {
                
                if (move.1 != 0){
                    if getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1)) == 64 {
                      break
                    } else {
                        let hol_ID = getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1))
                        
                        if Holders[hol_ID].piece_ID != 0 && Holders[hol_ID].piece_ID != 999 {
                            
                            if isEnemyPieceOnHolder(hol_ID) {
                                possibleHoldersIDs.append(hol_ID)
                            }
                            
                        } else if Holders[hol_ID].piece_ID == 0 {
                            possibleHoldersIDs.append(hol_ID)
                        }
                    }
                }
            }
        } else if piece_state == .restricted {
            
            
            let lineOfAttack = PinDirection()
            
            for move in moves {
                
                if move.0 == 2 || move.0 == -2 {
                    
                    let moveLine = (move.0/2,move.1)
                    
                    if moveLine == lineOfAttack || move == inv_dir(lineOfAttack) {
                        let hol_ID = getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1))
                        
                        if Holders[hol_ID].piece_ID == 0 && hol_ID != 64 {
                            possibleHoldersIDs.append(hol_ID)
                        }
                    }
                    
                }
                
                if move == lineOfAttack || move == inv_dir(lineOfAttack) {
                
                    if (move.1 != 0){
                        if getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1)) == 64 {
                            break
                        } else {
                            let hol_ID = getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1))
                            
                            if Holders[hol_ID].piece_ID != 0 && Holders[hol_ID].piece_ID != 999{
                                
                                if isEnemyPieceOnHolder(hol_ID) {
                                    possibleHoldersIDs.append(hol_ID)
                                }
                                
                            } else if Holders[hol_ID].piece_ID == 0 && hol_ID != 64 {
                                possibleHoldersIDs.append(hol_ID)
                            }
                        }

                    } else {
                        let hol_ID = getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1))
                        
                        if Holders[hol_ID].piece_ID == 0 && hol_ID != 64 {
                            possibleHoldersIDs.append(hol_ID)
                        }
                    }
                }
            }
        }
        return possibleHoldersIDs
    }
    
    func showPossiblePawnMoves() -> Void {
        let moves = getPieceMoves()
        let holderCoords = getHolderCoordsByPiece(ChosenPieceID)
        var possibleHoldersIDs: [Int] = []
        let piece_state = Assess(ChosenPieceID)
        if piece_state == .free {
            for move in moves {
                
                if (move.1 != 0){
                    if getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1)) == 64 {
                      break
                    } else {
                        let hol_ID = getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1))
                        
                        if Holders[hol_ID].piece_ID != 0 && Holders[hol_ID].piece_ID != 999 {
                            
                            if isEnemyPieceOnHolder(hol_ID) {
                                possibleHoldersIDs.append(hol_ID)
                            }
                            
                        } else if Holders[hol_ID].piece_ID == 0 {
                            let mod = Pieces[ChosenPieceID-1].piece_type == .bPawn ? 1 : -1
                            let hol_ID2 = getHolderIDFromCoord(Coord(holderCoords.rank+move.0+mod, holderCoords.file+move.1))
                            let p_ID = Holders[hol_ID2].piece_ID
                            if Holders[hol_ID2].piece_ID > 0 && Holders[hol_ID2].piece_ID != 999 && hol_ID2 != 64 {
                                if Pieces[p_ID-1].isEnpassantable() && isEnemyPieceOnHolder(hol_ID2){
                                    possibleHoldersIDs.append(hol_ID)
                                }
                            }
                        }
                    }
                } else {
                    let hol_ID = getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1))
                    
                    if Holders[hol_ID].piece_ID == 0 && hol_ID != 64 {
                        possibleHoldersIDs.append(hol_ID)
                    }
                }
            }
            PossibleMoves = possibleHoldersIDs
        } else if piece_state == .restricted {
            
            let KingID = Pieces[ChosenPieceID-1].color == 1 ? 5 : 29
            if getProtectingPiecesIDs(KingID).contains(where: {$0 == ChosenPieceID}) {
                
                let lineOfAttack = PinDirection()
                
                for move in moves {
                    if move == lineOfAttack || move == inv_dir(lineOfAttack){
                    
                        if (move.1 != 0){
                            if getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1)) == 64 {
                                break
                            } else {
                                let hol_ID = getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1))
                                
                                if Holders[hol_ID].piece_ID != 0 && Holders[hol_ID].piece_ID != 999{
                                    
                                    if isEnemyPieceOnHolder(hol_ID) {
                                        possibleHoldersIDs.append(hol_ID)
                                    }
                                    
                                } else if Holders[hol_ID].piece_ID == 0 && hol_ID != 64 {
                                    let mod = Pieces[ChosenPieceID-1].piece_type == .bPawn ? 1 : -1
                                    let hol_ID2 = getHolderIDFromCoord(Coord(holderCoords.rank+move.0+mod, holderCoords.file+move.1))
                                    let p_ID = Holders[hol_ID2].piece_ID
                                    if Holders[hol_ID2].piece_ID > 0 && Holders[hol_ID2].piece_ID != 999 && hol_ID2 != 64 {
                                        if Pieces[p_ID-1].isEnpassantable() && isEnemyPieceOnHolder(hol_ID2){
                                            possibleHoldersIDs.append(hol_ID)
                                        }
                                    }
                                }
                            }

                        } else {
                            let hol_ID = getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1))
                            
                            if Holders[hol_ID].piece_ID == 0 && hol_ID != 64 {
                                possibleHoldersIDs.append(hol_ID)
                            }
                        }
                    }
                }
                PossibleMoves = possibleHoldersIDs
            } else {
                PossibleMoves = possibleHoldersIDs
            }
        } else {
            
            PossibleMoves = possibleHoldersIDs
        }
    }
    
    func showPossiblePawnMoves2() -> Void {
        let moves = getPieceMoves()
        let holderCoords = getHolderCoordsByPiece(ChosenPieceID)
        var possibleHoldersIDs: [Int] = []
        let piece_state = Assess(ChosenPieceID)
        if piece_state == .free {
            MOVES: for move in moves {
                
                if (move.1 != 0){
                    if getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1)) == 64 {
                      continue MOVES
                    } else {
                        let hol_ID = getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1))
                        
                        if Holders[hol_ID].piece_ID != 0 && Holders[hol_ID].piece_ID != 999 {
                            
                            if isEnemyPieceOnHolder(hol_ID) {
                                possibleHoldersIDs.append(hol_ID)
                            }
                            
                        } else if Holders[hol_ID].piece_ID == 0 {
                            let mod = Pieces[ChosenPieceID-1].piece_type == .bPawn ? 1 : -1
                            let hol_ID2 = getHolderIDFromCoord(Coord(holderCoords.rank+move.0+mod, holderCoords.file+move.1))
                            let p_ID = Holders[hol_ID2].piece_ID
                            if Holders[hol_ID2].piece_ID > 0 && Holders[hol_ID2].piece_ID != 999 && hol_ID2 != 64 {
                                if isEnpassantable2(p_ID) && isEnemyPieceOnHolder(hol_ID2){
                                    possibleHoldersIDs.append(hol_ID)
                                }
                            }
                        }
                    }
                } else {
                    if getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1)) == 64 {
                        continue MOVES
                    } else {
                        let hol_ID = getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1))
                        
                        if Holders[hol_ID].piece_ID == 0 {
                            possibleHoldersIDs.append(hol_ID)
                        }
                    }
                }
            }
            PossibleMoves = possibleHoldersIDs
            print(PossibleMoves)
        } else if piece_state == .restricted {
            
            
            let lineOfAttack = PinDirection()
            
            for move in moves {
                
                if move.0 == 2 || move.0 == -2 {
                    
                    let moveLine = (move.0/2,move.1)
                    
                    if moveLine == lineOfAttack || move == inv_dir(lineOfAttack) {
                        let hol_ID = getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1))
                        
                        if Holders[hol_ID].piece_ID == 0 && hol_ID != 64 {
                            possibleHoldersIDs.append(hol_ID)
                        }
                    }
                    
                }
                
                if move == lineOfAttack || move == inv_dir(lineOfAttack) {
                
                    if (move.1 != 0){
                        if getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1)) == 64 {
                            break
                        } else {
                            let hol_ID = getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1))
                            
                            if Holders[hol_ID].piece_ID != 0 && Holders[hol_ID].piece_ID != 999{
                                
                                if isEnemyPieceOnHolder(hol_ID) {
                                    possibleHoldersIDs.append(hol_ID)
                                }
                                
                            } else if Holders[hol_ID].piece_ID == 0 && hol_ID != 64 {
                                let mod = Pieces[ChosenPieceID-1].piece_type == .bPawn ? 1 : -1
                                let hol_ID2 = getHolderIDFromCoord(Coord(holderCoords.rank+move.0+mod, holderCoords.file+move.1))
                                let p_ID = Holders[hol_ID2].piece_ID
                                if Holders[hol_ID2].piece_ID > 0 && Holders[hol_ID2].piece_ID != 999 && hol_ID2 != 64 {
                                    if isEnpassantable2(p_ID) && isEnemyPieceOnHolder(hol_ID2){
                                        possibleHoldersIDs.append(hol_ID)
                                    }
                                }
                            }
                        }

                    } else {
                        let hol_ID = getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1))
                        
                        if Holders[hol_ID].piece_ID == 0 && hol_ID != 64 {
                            possibleHoldersIDs.append(hol_ID)
                        }
                    }
                }
            }
            PossibleMoves = possibleHoldersIDs
            print(PossibleMoves)
        } else {
            
            PossibleMoves = possibleHoldersIDs
            print(PossibleMoves)
        }
    }
    
    func PossiblePiecesStateMoves() -> Void {
        let p_s = Assess(ChosenPieceID)
        switch p_s {
        case .free, .restricted:
            showPossiblePiecesMoves()
            break
        case .none:
            
            break;
        }
    }
    
    func getPossiblePiecesMoves(_ p_ID: Int) -> [Int] {
        let moves = getPieceMovesFor(p_ID)
        let holderCoords = getHolderCoordsByPiece(p_ID)
        var possibleHoldersIDs: [Int] = []
        
        if Pieces[p_ID-1].piece_type == .King || Pieces[p_ID-1].piece_type == .Knight {
            MOVES: for move in moves {
                if getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1)) == 64 {
                    continue MOVES
                } else {
                    let hol_ID = getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1))
                    
                    if Holders[hol_ID].piece_ID > 0 && Holders[hol_ID].piece_ID != 999{
                        
                        if isEnemyPieceOnHolderFor(hol_ID,p_ID) {
                            
                            possibleHoldersIDs.append(hol_ID)
                            break
                        } else {
                            break
                        }
                    } else if Holders[hol_ID].piece_ID == 0 {
                        possibleHoldersIDs.append(hol_ID)
                    }
                }
            }
        } else {
            MOVES: for move in moves {
                for x in 1...8 {
                    if getHolderIDFromCoord(Coord(holderCoords.rank+(move.0*x), holderCoords.file+(move.1*x))) == 64 {
                        continue MOVES
                    } else {
                        let hol_ID = getHolderIDFromCoord(Coord(holderCoords.rank+(move.0*x), holderCoords.file+(move.1*x)))
                        
                        if Holders[hol_ID].piece_ID > 0 && Holders[hol_ID].piece_ID != 999{
                            
                            if isEnemyPieceOnHolderFor(hol_ID,p_ID) {
                                
                                possibleHoldersIDs.append(hol_ID)
                                break
                            } else {
                                break
                            }
                        } else if Holders[hol_ID].piece_ID == 0 {
                            possibleHoldersIDs.append(hol_ID)
                        }
                    }
                }
            }
        }
        return possibleHoldersIDs
    }
    
    func getHolderIdByPieceId(_ p_ID: Int) -> Int {
        for h in Holders {
            if h.piece_ID == p_ID {
                return h.id
            }
        }
        return 0
    }
    
    
    func showPossiblePiecesMoves() -> Void {
        let moves = getPieceMoves()
        let holderCoords = getHolderCoordsByPiece(ChosenPieceID)
        
        var possibleHoldersIDs: [Int] = []
        let piece_state = Assess(ChosenPieceID)

        if piece_state == .restricted {
            if Pieces[ChosenPieceID-1].piece_type == .Knight {
                return
            }
            let dir = inv_dir(PinDirection())
            if(moveMultiplier()){
                for x in 1...8 {
                    if getHolderIDFromCoord(Coord(holderCoords.rank+(dir.0*x), holderCoords.file+(dir.1*x))) == 64 {
                        break
                    } else {
                        let hol_ID = getHolderIDFromCoord(Coord(holderCoords.rank+(dir.0*x), holderCoords.file+(dir.1*x)))
                        
                        if Holders[hol_ID].piece_ID > 0 && Holders[hol_ID].piece_ID != 999 {
                            
                            if isEnemyPieceOnHolder(hol_ID) {
                                
                                possibleHoldersIDs.append(hol_ID)
                                break
                            } else {
                                break
                            }
                        } else if Holders[hol_ID].piece_ID == 0 {
                            possibleHoldersIDs.append(hol_ID)
                        }
                    }
                }
            } else {
                
                let hol_ID = getHolderIDFromCoord(Coord(holderCoords.rank+dir.0, holderCoords.file+dir.1))
                
                if Holders[hol_ID].piece_ID > 0 && Holders[hol_ID].piece_ID != 999 {
                    
                    if isEnemyPieceOnHolder(hol_ID) {
                        
                        possibleHoldersIDs.append(hol_ID)
                    }
                } else if Holders[hol_ID].piece_ID == 0 {
                    possibleHoldersIDs.append(hol_ID)
                }
            }
            PossibleMoves = possibleHoldersIDs
            
        } else if piece_state == .free {
            for move in moves {
                if(moveMultiplier()){
                    for x in 1...8 {
                        if getHolderIDFromCoord(Coord(holderCoords.rank+(move.0*x), holderCoords.file+(move.1*x))) != 64 {
                            
                            let hol_ID = getHolderIDFromCoord(Coord(holderCoords.rank+(move.0*x), holderCoords.file+(move.1*x)))
                            
                            if Holders[hol_ID].piece_ID > 0 && Holders[hol_ID].piece_ID != 999{
                                
                                if isEnemyPieceOnHolder(hol_ID) {
                                    
                                    possibleHoldersIDs.append(hol_ID)
                                    break
                                } else {
                                    break
                                }
                            } else if Holders[hol_ID].piece_ID == 0 {
                                possibleHoldersIDs.append(hol_ID)
                            }
                        }
                    }
                } else {
                    if getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1)) != 64 {
                        
                        let hol_ID = getHolderIDFromCoord(Coord(holderCoords.rank+move.0, holderCoords.file+move.1))
                        
                        if Holders[hol_ID].piece_ID > 0 && Holders[hol_ID].piece_ID != 999 {
                            
                            if isEnemyPieceOnHolder(hol_ID) {
                                
                                possibleHoldersIDs.append(hol_ID)
                            }
                        } else if Holders[hol_ID].piece_ID == 0 {
                            possibleHoldersIDs.append(hol_ID)
                        }
                    }
                }
            }
            PossibleMoves = possibleHoldersIDs
        } else {
            PossibleMoves = possibleHoldersIDs
        }
    }
    
    func showPossibleMoves() -> Void {
        if (Pieces[ChosenPieceID-1].piece_type == .bPawn || Pieces[ChosenPieceID-1].piece_type == .wPawn){
            showPossiblePawnMoves2()
        } else if Pieces[ChosenPieceID-1].piece_type == .King {
            showPossibleKingMoves()
        } else {
            showPossiblePiecesMoves()
        }
    }
    
    func hidePossibileMoves() -> Void {

        PossibleMoves.removeAll()
    }
    
    func moveMultiplier() -> Bool {
        if (Pieces[ChosenPieceID-1].piece_type == .Bishop || Pieces[ChosenPieceID-1].piece_type == .Rook || Pieces[ChosenPieceID-1].piece_type == .Queen) {
            return true
        } else {
            return false
        }
    }
    
    func moveMultiplier(_ p_ID: Int) -> Bool {
        if (Pieces[p_ID-1].piece_type == .Bishop || Pieces[p_ID-1].piece_type == .Rook || Pieces[p_ID-1].piece_type == .Queen) {
            return true
        } else {
            return false
        }
    }
}

var RelationSign = [ Relation.capture_threat : "-->",
                     Relation.mutual_capture_threat : "<->",
                     Relation.pin : "->x",
                     Relation.pin_with_movement_possibility : ">-x",
                     Relation.pin_with_mutual_capture_threat : "<>x",
                     Relation.check : ">>x",
                     Relation.protects : "-|x",
                     Relation.promotion : "^^^",
                     Relation.en_passant : "_^_",
                     Relation.none : "-X-"
]

var Moves2 = [ PieceTypes.wPawn : Moves.wpawn,
               PieceTypes.bPawn : Moves.bpawn,
               PieceTypes.Knight : Moves.knight,
               PieceTypes.Bishop : Moves.bishop,
               PieceTypes.Rook : Moves.rook,
               PieceTypes.Queen : Moves.queen,
               PieceTypes.King : Moves.king]

@main
struct Chess_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

extension Array where Element: Hashable {
    func difference(from other: [Element]) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array(thisSet.symmetricDifference(otherSet))
    }
}
