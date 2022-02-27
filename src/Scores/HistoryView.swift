import SwiftUI

struct HistoryView: View {
    
    // Current view target
    // Either extended or normal
    let target: History.Target
    
    @Binding var isPresent: Bool
    
    @Environment(\.presentationMode) var presMode
    
    var body: some View {
        
        if ((target == .extended) ? History.shared.extendedTurns : History.shared.normalTurns).count == 0 {
            Text("No turns available")
        } else {
            List(target == .extended ? History.shared.extendedTurns : History.shared.normalTurns) { i in
                VStack(alignment: .leading, spacing: 5) {
                    if i.playerIcon == nil {
                        Text("Start turn")
                    } else {
                        Text("\(i.playerIcon!.icon) - \(i.computerIcon!.icon)")
                            .font(.custom("normal", size: 20))
                            .padding(3)
                    }
                    Text("Player: \(i.playerScore) | Computer: \(i.computerScore)")
                        .font(.custom("subtext", size: 14))
                        .foregroundColor(.gray)
                }
                .swipeActions {
                    Button(role: .destructive) {
                        History.shared.revertToTurn(revertableTurn: i)
                        isPresent = false
                    } label: {
                        Label("Revert", systemImage: "arrowshape.turn.up.left.fill")
                    }
                }
            }
        }
    }
}
