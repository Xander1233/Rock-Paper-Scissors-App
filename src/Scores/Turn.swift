import SwiftUI

struct Turn: Identifiable {
    
    private static var Id = 0
    
    let id: Int = Turn.getId()
    
    let playerIcon: Icon?
    let computerIcon: Icon?
    
    let playerScore: Int
    let computerScore: Int
    
    private static func getId() -> Int {
        Turn.Id += 1
        return Turn.Id
    }
    
}
