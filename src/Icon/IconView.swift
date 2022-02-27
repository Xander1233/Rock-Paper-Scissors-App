import SwiftUI

struct IconView: View {
    
    public let icon: Icon
    
    var body: some View {
        HStack {
            HStack {
                Text(icon.icon)
                    .frame(width: 60, height: 60)
                    .cornerRadius(10)
                    .font(.custom("San Francisco", size: 60))
                Spacer()
                Text(icon.name)
                    .frame(width: .infinity, alignment: .center)
            }
            .frame(width: 130, alignment: .center)
        }
        .frame(width: 200, height: 60, alignment: .center)
        .background(.blue)
        .cornerRadius(10)
        .padding(.all, 3)
    }
}
