import SwiftUI

struct StoreView: View {
    @EnvironmentObject var user: User
    @Binding var accountBackgroundColor: Color
    @Binding var accountBackgroundImage: String?
    @Binding var profileImage: String

    let profileImages = ["colt1", "brock", "frank1"]
    let backgroundImages = [nil, "purple1"]

    var body: some View {
        ZStack {
            
            if let bgImage = accountBackgroundImage {
                Image(bgImage)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            } else {
                accountBackgroundColor
                    .ignoresSafeArea()
            }

            VStack(alignment: .center) {

                Text("STORE")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top)

             
                HStack {
                    Text("GEMS: \(user.gems)")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.black)

                    Image("gems1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 50)
                        .padding(.leading, 10)
                }
                .padding()

                
                Text("Backgrounds")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.bottom, 5)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 80) {
                       
                        Button(action: {
                            accountBackgroundImage = nil
                            accountBackgroundColor = .purple
                        }) {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.purple)
                                .frame(width: 120, height: 120)
                                .overlay(
                                    Text("Purple")
                                        .foregroundColor(.white)
                                        .bold()
                                )
                                .shadow(radius: 5)
                        }

                        
                        Button(action: {
                            accountBackgroundImage = nil
                            accountBackgroundColor = .white
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                                    .frame(width: 120, height: 120)
                                    .shadow(radius: 5)

                                Text("Default")
                                    .foregroundColor(.black)
                                    .bold()
                            }
                        }

                        
                        ForEach(backgroundImages.indices, id: \.self) { index in
                            if let imageName = backgroundImages[index] {
                                Button(action: {
                                    accountBackgroundImage = imageName
                                }) {
                                    Image(imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 120, height: 120)
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }

          
                Text("Choose Your Profile")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.top, 30)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(profileImages, id: \.self) { imageName in
                            Button(action: {
                                profileImage = imageName
                            }) {
                                Image(imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 120, height: 120)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(profileImage == imageName ? Color.blue : Color.clear, lineWidth: 4))
                                    .shadow(radius: 5)
                            }
                        }
                    }
                    .padding(.horizontal)
                }

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    @State var backgroundColor: Color = .white
    @State var backgroundImage: String? = nil
    @State var profile: String = "colt1"

    return StoreView(
        accountBackgroundColor: $backgroundColor,
        accountBackgroundImage: $backgroundImage,
        profileImage: $profile
    )
    .environmentObject(User())
}
