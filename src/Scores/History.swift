import SwiftUI

struct History {
    
    public static var shared = History()
    
    var turnId = 0
    
    var normalTurns: [Turn] = [ Turn(playerIcon: nil, computerIcon: nil, playerScore: NormalRPSModel.getInstance().playerScore, computerScore: NormalRPSModel.getInstance().computerScore) ]
    
    var extendedTurns: [Turn] = [ Turn(playerIcon: nil, computerIcon: nil, playerScore: ExtendedRPSModel.getInstance().playerScore, computerScore: ExtendedRPSModel.getInstance().computerScore) ]
    
    let extendedModel = ExtendedRPSModel.getInstance()
    let normalModel = NormalRPSModel.getInstance()
    
    mutating func insertTurn(insert turn: Turn, target: Target) {
        switch(target) {
            case .extended:
            extendedTurns.append(turn)
            case .normal:
            normalTurns.append(turn)
        }
    }
    
    mutating func revertToTurn(revertableTurn turn: Turn) {
        
        if normalTurns.contains(where: {
            $0.id == turn.id
        }) {
            let index = normalTurns.firstIndex {
                $0.id == turn.id
            }
            
            if index == nil {
                return
            }
                
            normalTurns = [] + normalTurns[0...index!]
            
            normalModel.playerScore = turn.playerScore
            normalModel.computerScore = turn.computerScore
            normalModel.playerIcon = turn.playerIcon
            normalModel.computerIcon = turn.computerIcon
            
            return
        }
        
        if extendedTurns.contains(where: {
            $0.id == turn.id
        }) {
            
            let index = extendedTurns.firstIndex {
                $0.id == turn.id
            }
            
            if index == nil {
                return
            }
            
            extendedTurns = [] + extendedTurns[0...index!]
            
            extendedModel.playerScore = turn.playerScore
            extendedModel.computerScore = turn.computerScore
            extendedModel.playerIcon = turn.playerIcon
            extendedModel.computerIcon = turn.computerIcon
        }
    }
    
    mutating func reset() {
        extendedTurns = [ Turn(playerIcon: nil, computerIcon: nil, playerScore: ExtendedRPSModel.getInstance().playerScore, computerScore: ExtendedRPSModel.getInstance().computerScore) ]
        normalTurns = [ Turn(playerIcon: nil, computerIcon: nil, playerScore: NormalRPSModel.getInstance().playerScore, computerScore: NormalRPSModel.getInstance().computerScore) ]
    }
    
    enum Target {
        case normal
        case extended
    }
}
