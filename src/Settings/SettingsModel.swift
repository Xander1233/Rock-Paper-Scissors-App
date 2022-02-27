import SwiftUI

class SettingsModel: ObservableObject {
    static let shared = SettingsModel()
    
    // Settings
    
    @AppStorage("current_color_scheme") var currentColorScheme: ColorSchemeEnum = .Auto
    @AppStorage("reduce_motion") var reduceMotion: ReduceMotionEnum = .Auto
}
