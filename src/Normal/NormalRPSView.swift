import SwiftUI

struct NormalRPSView: View {
    
    let model = NormalRPSModel.getInstance()
    
    @State private var hasChoosen = false
    @State private var result = Score.none
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text("\(result == .none || !hasChoosen ? "Choose one below" : result == .computer ? "You lost" : result == .player ? "You won" : "Draw")")
                    .font(.custom("San Francisco", size: 25))
                    .frame(width: 250, height: 50)
                    .animation((!(SettingsModel.shared.reduceMotion.currentValue ?? reduceMotion)) ? Animation.easeInOut(duration: 0.1) : nil, value: result)
                
                Text("\(model.computerIcon?.name ?? " ")")
                    .animation((!(SettingsModel.shared.reduceMotion.currentValue ?? reduceMotion)) ? Animation.easeInOut(duration: 0.1) : nil, value: model.computerIcon?.name)
                Spacer()
                
                ForEach(model.icons) { icon in
                    Button {
                        choose(icon)
                    } label: {
                        IconView(icon: icon)
                    }
                    .disabled(hasChoosen && model.playerIcon?.id != icon.id)
                    .buttonStyle(.plain)
                    .shadow(color: !hasChoosen ? .clear : model.playerIcon?.id == icon.id ? result == .player ? .green : .red : model.computerIcon?.id == icon.id ? result == .computer ? .green : .red : .clear, radius: 10)
                    .animation((!(SettingsModel.shared.reduceMotion.currentValue ?? reduceMotion)) ? Animation.easeInOut(duration: 0.1) : nil, value: hasChoosen)
                }
                
                Spacer()
                
                Button {
                    hasChoosen = false
                    result = .none
                    model.computerIcon = nil
                } label: {
                    Image(systemName: "arrow.counterclockwise")
                    Text("Restart")
                }
                .frame(width: 200, height: 60)
                .font(.custom("San Francisco", size: 30))
                .foregroundColor(.white)
                .background(.red)
                .cornerRadius(10)
                .animation(.easeInOut, value: hasChoosen)
                .opacity(result != .none ? 1 : 0)
                .animation((!(SettingsModel.shared.reduceMotion.currentValue ?? reduceMotion)) ? Animation.easeInOut(duration: 0.1) : nil, value: result)
                
                Spacer()
            }
            .frame(width: .infinity, height: 700)
            
            if result == .player && (!(SettingsModel.shared.reduceMotion.currentValue ?? reduceMotion)) {
                Circle()
                    .fill(.blue)
                    .modifier(ParticlesModifier())
                    .frame(width: 10, height: 10)
                    .offset(x: -100, y: -50)
                Circle()
                    .fill(.red)
                    .modifier(ParticlesModifier())
                    .frame(width: 10, height: 10)
                    .offset(x: 60, y: 70)
            }
        }
    }
    
    private func choose(_ icon: Icon) {
        if hasChoosen {
            return
        }
        
        let result = model.choose(playerIcon: icon)
        
        hasChoosen = true
        
        self.result = result
    }
}
