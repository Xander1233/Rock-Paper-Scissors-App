import SwiftUI

@main
struct MyApp: App {

    @ObservedObject var appSettings = SettingsModel.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
            // Check for dark/light mode and switch
                .preferredColorScheme(appSettings.currentColorScheme.currentValue == nil ? (UITraitCollection.current.userInterfaceStyle == .dark ? .dark : .light) : appSettings.currentColorScheme.currentValue)
        }
    }
}
