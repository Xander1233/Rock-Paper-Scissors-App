import SwiftUI

struct ParticlesModifier: ViewModifier {
    
    @State var time = 0.0
    @State var scale = 0.1
    let duration = 4.0
    
    var won = true
    
    func body(content: Content) -> some View {
        
        ZStack {
            ForEach(0..<60, id: \.self) { i in
                content
                    .hueRotation(won ? Angle(degrees: time * 80) : Angle())
                    .scaleEffect(scale)
                    .modifier(FireworkParticlesGeometryEffect(time: time))
                    .opacity(((duration - time) / duration))
            }
        }
        .onAppear {
            withAnimation (.easeOut(duration: duration)) {
                self.time = duration
                self.scale = 1.0
            }
        }
        
    }
}
