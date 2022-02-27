import SwiftUI

enum ReduceMotionEnum: Int {
    case Auto
    case Remove
    case Override
    
    var currentValue: Bool? {
        switch self {
            case .Auto:
            return nil
            case .Override:
            return false
            case .Remove:
            return true
        }
    }
}
