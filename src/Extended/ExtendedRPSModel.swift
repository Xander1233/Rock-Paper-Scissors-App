import SwiftUI

class ExtendedRPSModel: ObservableObject {
    public let icons: [Icon] = [
        Icon(id: "1", name: "Stone", icon: "🪨", winsAgainst: [
            "2", "4"
        ]),
        Icon(id: "2", name: "Scissor", icon: "✂️", winsAgainst: [
            "3", "4"
        ]),
        Icon(id: "3", name: "Paper", icon: "📄", winsAgainst: [
            "1", "5"
        ]),
        Icon(id: "4", name: "Lizard", icon: "🦎", winsAgainst: [
            "5", "3"
        ]),
        Icon(id: "5",name: "Spock", icon: "🖖", winsAgainst: [
            "1", "2"
        ])
    ]
    
    @AppStorage("extended_player_score") public var playerScore = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    @AppStorage("extended_computer_score") public var computerScore = 0 {
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
    
    private static let instance = ExtendedRPSModel()
    
    public static func getInstance() -> ExtendedRPSModel {
        return ExtendedRPSModel.instance
    }
    
    private func getComputerChoice() -> Icon {
        let index = Int.random(in: 0..<icons.count)
        return icons[index]
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
        History.shared.insertTurn(insert: Turn(playerIcon: self.playerIcon!, computerIcon: self.computerIcon!, playerScore: playerScore, computerScore: computerScore), target: .extended)
    }
    
    public func resetScore() {
        playerScore = 0
        computerScore = 0
    }
}
