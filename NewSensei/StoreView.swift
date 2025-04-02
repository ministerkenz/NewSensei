import SwiftUI

struct StoreView: View {
    @Binding var accountBackgroundColor: Color
    @Binding var profileImage: String

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
                    Text("GEMS: 1000")
                        .font(.title)
                        .bold()
                    Image("gems1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .padding(.leading, 10)
                }
                .padding()

                // Button to Toggle Background Color (Purple/White)
                Button(action: {
                    accountBackgroundColor = (accountBackgroundColor == .white) ? .purple : .white
                }) {
                    Image("purple1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
                .padding()

                // Button to Toggle Profile Image (colt1 <-> frank1)
                Button(action: {
                    profileImage = (profileImage == "colt1") ? "frank1" : "colt1"
                }) {
                    Image("frank1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                }
                .padding()
            }
            .padding()
        }
    }
}

#Preview {
    StoreView(accountBackgroundColor: .constant(.white), profileImage: .constant("colt1"))
}
