import SwiftUI
import FirebaseDatabase
import FirebaseAuth

struct SignUpView: View {
    @EnvironmentObject var user: User
    @Binding var navigateToHome: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                
                VStack {
                    Spacer()
                    Text("Welcome to Sensei")
                        .font(.title)
                    Spacer()
                    
                    
                    TextField("Email Address", text: $user.email)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $user.password)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        Task {
                            await login()
                            navigateToHome = true
                        }
                    }, label: {
                        Text("Log In")
                            .padding()
                            .frame(minWidth: 200)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    })
                    .padding()
                    
                    HStack {
                        Text("New to the Sensei?")
                        Button(action: {
                            Task {
                                await createUser()
                            }
                        }, label: {
                            Text("Create Account")
                                .foregroundColor(.blue)
                                .underline()
                        })
                    }
                    .padding(.bottom, 60)
                    
                }
                .padding()
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    
    
    func login() async {
        do {
            try await Auth.auth().signIn(withEmail: user.email, password: user.password)
            user.isUserAuthenticated = true
            // Enable navigation to home screen after successful login
            DispatchQueue.main.async {
                navigateToHome = true
            }
            
            guard let uid = Auth.auth().currentUser?.uid else {return}
            
            guard let data = try? await Database.database().reference().child("users/\(uid)").getData() else {return}
            
            // cast data.value to a dictionary and pass to decode
            guard let dictionary = data.value as? [String: Any] else {return}
            user.decode(data: dictionary)
        } catch let e as Error {
            print(e)
        }
    }
    
    func createUser() async {
        do {
            let authResult = try await Auth.auth().createUser(withEmail: user.email, password: user.password)
            user.isUserAuthenticated = true
        } catch let e as Error {
            print(e)
        }
    }
}
#Preview {
    SignUpView(navigateToHome: .constant(false))
        .environmentObject(User())
}
