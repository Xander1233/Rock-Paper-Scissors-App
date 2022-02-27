import SwiftUI

struct Settings: View {
    
    @State private var showConfirmResetDialog = false
    
    var body: some View {
        Form {
            Section {
                // Picker to switch between color scheme
                Picker("Color scheme", selection: SettingsModel.shared.$currentColorScheme) {
                    Text("Auto").tag(ColorSchemeEnum.Auto)
                    Text("Light").tag(ColorSchemeEnum.Light)
                    Text("Dark").tag(ColorSchemeEnum.Dark)
                }
                .pickerStyle(.segmented)
            } header: {
                Text("Color scheme")
            } footer: {
                Text("Change the color scheme appearance of the App\n\nAuto: Use the global settings from your system (Bug)\n\nLight: Override the global settings and set the color scheme to light mode\n\nDark: Override the global settings and set the color scheme to dark mode")
            }
            
            Section {
                // Picker to switch between reduced motion states
                Picker("Reduce Motion", selection: SettingsModel.shared.$reduceMotion) {
                    Text("Auto").tag(ReduceMotionEnum.Auto)
                    Text("Disable").tag(ReduceMotionEnum.Override)
                    Text("Enable").tag(ReduceMotionEnum.Remove)
                }
                .pickerStyle(.segmented)
            } header: {
                Text("Reduce Motion")
            } footer: {
                Text("Configure whether the motion should be reduced\n\nAuto: Use the global settings from your system\n\nDisable: Override the global settings and disable reduced motion\n\nEnable: Override the global settings and enable reduced motion")
            }
            
            Section {
                Button(role: .destructive) {
                    ExtendedRPSModel.getInstance().resetScore()
                    NormalRPSModel.getInstance().resetScore()
                    History.shared.reset()
                } label: {
                    Text("Reset current scores")
                }
            }
        }
        .frame(maxWidth: 600)
    }
}
