import SwiftUI

enum ColorSchemeEnum: Int {
    case Dark
    case Light
    case Auto
    
    var currentValue: ColorScheme? {
        switch self {
            case .Auto:
            return nil
            case .Dark:
            return .dark
            case .Light:
            return .light
        }
    }
}
