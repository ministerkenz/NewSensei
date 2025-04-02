import SwiftUI
import FirebaseDatabase
import FirebaseAuth

struct ProgressView: View {
    @EnvironmentObject var user: User
    @State private var firstImage = "colt1"
    @State private var secondImage = "brock"
    @State private var progress: Double = 0.0
    @Binding var progress1: ProgressBar
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white
                    .ignoresSafeArea(.all)
                VStack {
                    HStack {
                        NavigationLink(destination: SecondView(firstImage: $firstImage, secondImage: $secondImage)) {
                            Image(firstImage)
                                .resizable()
                                .padding()
                                .frame(width: 200, height: 200, alignment: .topTrailing)
                        }
                        VStack {
                            TextField("user0019091", text:$user.userName)
                                .bold()
                                .font(.title)
                            Text("Skill: ??")
                                .bold()
                                .font(.title)
                        }
                        Spacer()
                    }
                    .padding()
                    Spacer()
                    ProgressBar()
                    Text("\(Int(200 - progress)) points left")
                        .font(.headline)
                        .bold()
                        .padding(.top, 5)
                    Button(action: {
                        Task {
                            guard let uid = Auth.auth().currentUser?.uid else {return}
                            
                            let result = try? await Database.database().reference().child("users").child(uid).setValue(user.encode())
                        }
                    }, label: {
                        Text("Save Changes")
                            .padding()
                            .frame(minWidth: 150)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    })
                    
                }
                .padding()
            }
        }
    }
}




// SecondView Definition
struct SecondView: View {
    @Binding var firstImage: String
    @Binding var secondImage: String
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack {
                Text("Change your avatar")
                Button(action: {
                    let temp = firstImage
                    firstImage = secondImage
                    secondImage = temp
                }) {
                    Image(secondImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    ProgressView(progress1: Binding.constant(ProgressBar()))
        .environmentObject(User())
}
