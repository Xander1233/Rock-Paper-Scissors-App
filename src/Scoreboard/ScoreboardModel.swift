import SwiftUI

class ScoreboardModels: ObservableObject {
    static let shared = ScoreboardModels()
    
    public var player = 0
    public var pc = 0
}
