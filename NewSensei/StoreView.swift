import SwiftUI

struct StoreView: View {
    @State private var gems: Int = 1000
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            VStack {
                Text("STORE")
                    .font(.title)
                    .bold()
                    .padding()
            
                HStack {
                    Text("GEMS: \(gems)")
                        .font(.title)
                        .bold()
                    Image("gems1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .padding(.trailing, 10)
                }
                .padding()
               
                Button(action: {}, label: {
                    Image("frank1")
                })
                .padding()

                Button(action: {}, label: {
                    Image("purple1")
                })
            }
            .padding()
        }
    }
}

#Preview {
    StoreView()
}
