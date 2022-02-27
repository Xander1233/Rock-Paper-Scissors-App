import SwiftUI

struct ContentView: View {
    
    // States for tab view
    @State private var showRules = false
    @State private var selectedItem = 0
    @State private var oldSelectedItem = 0
    
    // State for navigation title switch upon tab switch
    @State private var title = "Extended RPS"
    
    // Observed objects for toolbar point updates
    @ObservedObject var extendedModel = ExtendedRPSModel.getInstance()
    @ObservedObject var normalModel = NormalRPSModel.getInstance()
    
    // State to show/hide history sheet
    @State var showHistory = false
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedItem) {
                ExtendedRPSView()
                    .tabItem {
                        VStack {
                            Image(systemName: "puzzlepiece.extension")
                            Text("Extended")
                        }
                    }
                // Tag 0 to keep track of selection
                    .tag(0)
                
                NormalRPSView()
                    .tabItem {
                        VStack {
                            Image(systemName: "dpad")
                            Text("Normal")
                        }
                    }
                // Tag 1 to keep track of selection
                    .tag(1)
                
                Text("")
                    .tabItem {
                        VStack {
                            Image(systemName: "book.closed")
                            Text("Rules")
                        }
                    }
                // Tag 2 to keep track of selection
                    .tag(2)
                
                Settings()
                    .tabItem {
                        VStack {
                            Image(systemName: "gear")
                            Text("Settings")
                        }
                    }
                // Tag 3 to keep track of selection
                    .tag(3)
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .onChange(of: selectedItem) {
                
                // Change the title according to current tab
                if selectedItem == 0 {
                    title = "Extended RPS"
                }
                if selectedItem == 1 {
                    title = "Normal RPS"
                }
                if selectedItem == 2 {
                    title = "Rules"
                }
                if selectedItem == 3 {
                    title = "Settings"
                }
                
                // Check if selected tab is tag 2 (Rules tab).
                // Show sheet if so
                if (2 == selectedItem) {
                    self.showRules = true
                } else {
                    self.oldSelectedItem = $0
                }
            }
            .sheet(isPresented: $showRules, onDismiss: {
                // Change current tab to the tab selection before selection rule tab
                self.selectedItem = oldSelectedItem
            }) {
                RuleView()
            }
            .sheet(isPresented: $showHistory, onDismiss: nil) {
                // SHow history for extended or normal RPS
                HistoryView(target: selectedItem == 0 ? .extended : .normal, isPresent: $showHistory)
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    VStack {
                        // Show button if extended/normal view is selected
                        if selectedItem < 2 {
                            Button {
                                // Show history sheet if button is clicked
                                showHistory = true
                            } label: {
                                VStack {
                                    Text("\(selectedItem == 0 ? "\(ExtendedRPSModel.getInstance().playerScore)" : selectedItem == 1 ? "\(NormalRPSModel.getInstance().playerScore)" : "")")
                                    Text("\(selectedItem < 2 ? "Player" : "")")
                                        .font(.caption2)
                                }
                            }
                        }
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    VStack {
                        // Show button if extended/normal view is selected
                        if selectedItem < 2 {
                            Button {
                                // Show history sheet if button is clicked
                                showHistory = true
                            } label: {
                                VStack {
                                    Text("\(selectedItem == 0 ? "\(ExtendedRPSModel.getInstance().computerScore)" : selectedItem == 1 ? "\(NormalRPSModel.getInstance().computerScore)" : "")")
                                    Text("\(selectedItem < 2 ? "Computer" : "")")
                                        .font(.caption2)
                                }
                            }
                        }
                    }
                }
            }
            .ignoresSafeArea(.keyboard)
        }
        .navigationViewStyle(.stack)
    }
}
