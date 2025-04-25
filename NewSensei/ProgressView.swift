import SwiftUI
import FirebaseAuth
import FirebaseDatabase

struct ProgressView: View {
    @EnvironmentObject var user: User
    @Binding var backgroundColor: Color
    @Binding var backgroundImage: String?

    // Total number of skills in your app
    private let totalSkills = 7

    var body: some View {
        let progress = CGFloat(user.completedSkills.count) / CGFloat(totalSkills)

        ZStack {
            // Background color/image
            if let backgroundImage = backgroundImage {
                Image(backgroundImage)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            } else {
                backgroundColor
                    .ignoresSafeArea()
            }

            ScrollView {
                VStack {
                    Spacer().frame(height: 40)

                    VStack {
                        Text("Progress Bar")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.top)

                        ProgressBar(progress: progress)
                            .padding()
                    }
                    .padding()
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(10)

                    Spacer().frame(height: 30)

                    Image(user.avater)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)

                    TextField(user.userName, text: $user.userName)
                        .font(.title2)
                        .padding()
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(10)
                        .padding(.horizontal)

                    Spacer().frame(height: 40)

                    Button {
                        Task {
                            guard let uid = Auth.auth().currentUser?.uid else { return }
                            _ = try? await Database.database().reference()
                                .child("users")
                                .child(uid)
                                .setValue(user.encode())
                        }
                    } label: {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(.blue)
                                .cornerRadius(20)
                                .frame(width: 350, height: 50)
                            Text("Update User Info")
                                .foregroundColor(.white)
                        }
                    }.padding()

                    Button {
                        let result = try? Auth.auth().signOut()
                        if let _ = result {
                            user.email = ""
                            user.password = ""
                            user.userName = ""
                            user.gems = 0
                            user.isUserAuthenticated = false
                            user.avater = ""
                            user.completedSkills = [:]
                        }
                    } label: {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(.blue)
                                .cornerRadius(20)
                                .frame(width: 350, height: 50)
                            Text("Log out")
                                .foregroundColor(.white)
                        }
                    }.padding(.bottom, 50)

                    Spacer().frame(height: 60)
                }
                .padding(.bottom, 40)
            }
        }
    }
}

#Preview {
    let testUser = User()
    testUser.completedSkills = ["tie": true, "laundry": true, "tire": true]

    return ProgressView(
        backgroundColor: .constant(.purple),
        backgroundImage: .constant(nil)
    )
    .environmentObject(testUser)
}
