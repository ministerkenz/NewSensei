import SwiftUI
import FirebaseAuth
import FirebaseDatabase

struct ProgressView: View {
    @EnvironmentObject var user: User
    @Binding var progress1: CGFloat // Binding for progress (progress is a CGFloat)
    @Binding var backgroundColor: Color
    @Binding var backgroundImage: String?
    @Binding var profileImage: String

    var body: some View {
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

            VStack {
                Spacer()
                Image(profileImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                Spacer()
                Spacer()
                Spacer()

            VStack {
                VStack {
                    Text("Progress Bar")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top)

                    ProgressBar(progress: progress1)
                        .padding()
                }
                .padding()
                .background(Color.black.opacity(0.5))
                .cornerRadius(10)
                
                Spacer()
                
                Image(profileImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                TextField("Enter user name", text: $user.userName)
                    .font(.title2)
                    .padding()
                Spacer()
                Spacer()
                Spacer()
                Button {
                    Task{
                        guard let uid = Auth.auth().currentUser?.uid else {return}
                        
                        let result = try? await Database.database().reference().child("users").child(uid).setValue(user.encode())
                    }
                } label: {
                    ZStack{
                        Rectangle()
                            .foregroundStyle(.blue)
                            .cornerRadius(20)
                            .frame(width: 350, height: 50)
                        Text("update user info")
                            .foregroundColor(.white)
                    }
                }.padding()
                Spacer()
            }
            .padding(.bottom, 40)
        }
    }
}

#Preview {
    ProgressView(progress1: .constant(0.55),
                 backgroundColor: .constant(.white),
                 backgroundImage: .constant(nil),
                 profileImage: .constant("colt1"))
    .environmentObject(User())

}
