import SwiftUI

struct Icon: Identifiable {
    public let id: String
    public var icon: String
    public var name: String
    
    public var winsAgainst: [String]
    
    public init(name: String, icon: String, winsAgainst: [String]) {
        self.name = name
        self.icon = icon
        self.id = "\(Int.random(in: 0..<999999999))"
        self.winsAgainst = winsAgainst
    }
    
    public init(id: String, name: String, icon: String, winsAgainst: [String]) {
        self.name = name
        self.icon = icon
        self.id = id
        self.winsAgainst = winsAgainst
    }
    
    public func checkWin(_ icon: Icon) -> Bool {
        return winsAgainst.contains(icon.id)
    }
    
    public func toCodable() -> IconCodable {
        return IconCodable(name: name, icon: icon, winsAgainst: winsAgainst)
    }
}

struct IconCodable: Codable {
    var name: String
    var icon: String
    var winsAgainst: [String]
}
