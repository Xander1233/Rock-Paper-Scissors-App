import SwiftUI

struct NormalRPSRules: View {
    
    private let text = [
        Text("Rock wins against Scissors"),
        Text("Rock loses against Paper"),
        Text("Paper wins against Rock"),
        Text("Paper loses against Scissors"),
        Text("Scissors win against Paper"),
        Text("Scissor loses against Rock")
    ]
    
    var i = 0
    
    var body: some View {
        VStack {
            Text("Rock Paper Scissors is a game, mostly used to help with decision making.\n\n2 people are required to play the game properly.\n\nEach Person can pick one of the three core elements:\n- Rock\n- Paper\n- Scissors\n\n\nEach element wins against one other element, and loses on the other side against the last remaining one:")
            
            VStack {
                HStack {
                    text[0]
                        .foregroundColor(.green)
                }
                
                HStack {
                    text[1]
                        .foregroundColor(.red)
                }
            }
            .padding()
            
            VStack {
                HStack {
                    text[2]
                        .foregroundColor(.green)
                }
                
                HStack {
                    text[3]
                        .foregroundColor(.red)
                }
            }
            .padding()
            
            VStack {
                HStack {
                    text[4]
                        .foregroundColor(.green)
                }
                
                HStack {
                    text[5]
                        .foregroundColor(.red)
                }
            }
            .padding()
        }
        .padding()
    }
}
