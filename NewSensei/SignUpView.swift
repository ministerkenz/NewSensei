import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct SignUpView: View {
    @EnvironmentObject var user: User
    @State private var userName = ""
    @State private var navigateToHome = false
    
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
                    
                    TextField("User Name (No need to type if you are signing in)", text: $userName)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
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
                    
                    NavigationLink(destination: Home_Screen(), isActive: $navigateToHome) {
                        EmptyView()
                    }
                }
                .padding()
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    func saveUserData(uid: String, userName: String) {
        let db = Firestore.firestore()
        
        let data: [String: Any] = [
            "user name": userName,
            "email": user.email
        ]
        
        db.collection("users").document(uid).setData(data) { error in
            if let error = error {
                print("Error saving user data: \(error.localizedDescription)")
            } else {
                print("User data saved successfully!")
                navigateToHome = true
            }
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
        } catch let e as Error {
            print(e)
        }
    }
    
    func createUser() async {
        do {
            let authResult = try await Auth.auth().createUser(withEmail: user.email, password: user.password)
            user.isUserAuthenticated = true
            saveUserData(uid: authResult.user.uid, userName: userName)
        } catch let e as Error {
            print(e)
        }
    }
}
