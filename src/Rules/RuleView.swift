import SwiftUI

struct RuleView: View {
    
    var body: some View {
        
        NavigationView {
            TabView {
                ExtendedRPSRules()
                    .tabItem {
                        VStack {
                            Image(systemName: "puzzlepiece.extension.fill")
                            Text("Extended")
                        }
                    }
                
                NormalRPSRules()
                    .tabItem {
                        VStack {
                            Image(systemName: "dpad.fill")
                            Text("Normal")
                        }
                    }
            }
            .navigationTitle("Rules")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
}
