import SwiftUI

class NormalRPSModel: ObservableObject {
    public let icons: [Icon] = [
        Icon(id: "1", name: "Stone", icon: "🪨", winsAgainst: [
            "2"
        ]),
        Icon(id: "2", name: "Scissor", icon: "✂️", winsAgainst: [
            "3"
        ]),
        Icon(id: "3", name: "Paper", icon: "📄", winsAgainst: [
            "1"
        ]),
    ]
    
    @AppStorage("normal_player_score") public var playerScore = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    
    @AppStorage("normal_player_score") public var computerScore = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    
    var playerIcon: Icon? = nil {
        willSet {
            objectWillChange.send()
        }
    }
    
    var computerIcon: Icon? = nil
    
    private static let instance = NormalRPSModel()
    
    public static func getInstance() -> NormalRPSModel {
        return NormalRPSModel.instance
    }
    
    private func getComputerChoice() -> Icon {
        return icons.randomElement()!
    }
    
    public func choose(playerIcon: Icon) -> Score {
        
        self.computerIcon = getComputerChoice()
        self.playerIcon = playerIcon
        
        if computerIcon!.icon == playerIcon.icon {
            self.insertTurn()
            return .draw
        }
        
        if computerIcon!.checkWin(playerIcon) {
            computerScore += 1
            self.insertTurn()
            return .computer
        }
        
        playerScore += 1
        self.insertTurn()
        return .player
    }
    
    private func insertTurn() {
        History.shared.insertTurn(insert: Turn(playerIcon: self.playerIcon!, computerIcon: self.computerIcon!, playerScore: playerScore, computerScore: computerScore), target: .normal)
    }
    
    public func resetScore() {
        computerScore = 0
        playerScore = 0
    }
}
