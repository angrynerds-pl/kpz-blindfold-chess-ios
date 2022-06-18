import Foundation

enum PlayState {
    case free
    case threatened
    case is_threatening
    case pinned
    case is_pinning
    case en_passantable
    case promotion
    case in_check
    case protects
    case gives_check
    case double_check
    case checkmate
}
