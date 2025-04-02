import SwiftUI

struct StoreView: View {
    @Binding var accountBackgroundColor: Color
    @Binding var accountBackgroundImage: String?
    @Binding var profileImage: String

    let profileImages = ["colt1", "brock", "frank1"] // Cycle through these
    let backgroundImages = [nil, "purple1"] // Toggle between these images
    let backgroundColors: [Color] = [.white, .purple] // Toggle between colors

    var body: some View {
        ZStack {
            accountBackgroundColor
                .ignoresSafeArea(edges: .all) // Makes the background ignore all safe areas

            VStack {
                // Larger "STORE" title
                Text("STORE")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top)

                // Gems section
                HStack {
                    Text("GEMS: 1000")
                        .font(.title2)
                        .bold()

                    Image("gems1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50) // Adjusted size
                        .padding(.leading, 10)
                }
                .padding()

                // Background Image Toggle Button
                Button(action: {
                    accountBackgroundImage = (accountBackgroundImage == nil) ? "purple1" : nil
                }) {
                    Image("purple1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150) // Larger image
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding()

                // Background Color Toggle Button
                Button(action: {
                    if let currentIndex = backgroundColors.firstIndex(of: accountBackgroundColor) {
                        let nextIndex = (currentIndex + 1) % backgroundColors.count
                        accountBackgroundColor = backgroundColors[nextIndex]
                    }
                }) {
                    Image("purple")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150) // Larger image
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding()

                // Profile Image Switch Button
                Button(action: {
                    if let currentIndex = profileImages.firstIndex(of: profileImage) {
                        let nextIndex = (currentIndex + 1) % profileImages.count
                        profileImage = profileImages[nextIndex]
                    }
                }) {
                    Image(profileImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200) // Larger profile image
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding()
            }
            .padding()
        }
    }
}

#Preview {
    StoreView(accountBackgroundColor: .constant(.white),
              accountBackgroundImage: .constant(nil),
              profileImage: .constant("colt1"))
}
