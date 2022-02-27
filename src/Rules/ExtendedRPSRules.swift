import SwiftUI

struct ExtendedRPSRules: View {
    
    private let text = [
        Text("Rock wins against Lizard and Scissors"),
        Text("Rock loses against Spock and Paper"),
        Text("Paper wins against Spock and Rock"),
        Text("Paper loses against Lizard and Scissors"),
        Text("Scissors win against Lizard and Paper"),
        Text("Scissors loses against Spock and Rock"),
        Text("Lizard wins against Spock and Paper"),
        Text("Lizard loses against Rock and Scissors"),
        Text("Spock wins against Rock and Scissors"),
        Text("Spock loses against Lizard and Paper")
    ]
    
    var body: some View {
        VStack {
            Text("The extended version of Rock Paper Scissors is in it's core the same as the normal version.\n\nIt just has 2 more elements (Lizard and Spock)\n\nAll Rules for each element are listed below:")
            
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
            
            VStack {
                HStack {
                    text[6]
                        .foregroundColor(.green)
                }
                
                HStack {
                    text[7]
                        .foregroundColor(.red)
                }
            }
            .padding()
            
            VStack {
                HStack {
                    text[8]
                        .foregroundColor(.green)
                }
                
                HStack {
                    text[9]
                        .foregroundColor(.red)
                }
            }
            .padding()
        }
        .padding()
    }
}
