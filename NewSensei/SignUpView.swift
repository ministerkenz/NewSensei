//
//  SignUpView.swift
//  Sensei
//
//  Created by Paul Han (student LM) on 2/26/25.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct SignUpView: View {
    @EnvironmentObject var user: User
    @State private var userName = ""
    var body: some View {
        ZStack{
            Rectangle()
            .foregroundColor(.white)
            VStack{
                Spacer()
                Text("Welcome to Sensei")
                    .font(.title)
                Spacer()
                TextField("User Name(No need to type if you are signing in)", text: $userName)
                    .padding()
                TextField("Email Address", text:$user.email)
                    .padding()
                SecureField("Password", text:$user.password)
                    .padding()
                Button(action: {
                    Task{
                        await createUser()
                    }
                }, label: {
                    Text("Log In")
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                })
                HStack {
                    Text("New to the Sensei?")
                    Button(action: {
                        Task{
                            await login()
                        }
                    }, label: {
                        Text("Create Account")
                            .foregroundColor(.blue)
                            .underline()
                })
                }.padding(.bottom, 60)
            }
        }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
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
                }
            }
        }
    
    func login() async{
        do{
            try await Auth.auth().signIn(withEmail: user.email, password: user.password)
                user.isUserAuthenticated = true

        }catch let e as Error{
            print(e)
        }
    }
    func createUser() async{
        do{
            try await Auth.auth().createUser(withEmail: user.email, password: user.password)
                user.isUserAuthenticated = true
            let authResult = try await Auth.auth().createUser(withEmail: user.email, password: user.password)

            
            saveUserData(uid: authResult.user.uid, userName: userName)
        }catch let e as Error{
            print(e)
        }
    }
}

#Preview {
    SignUpView()
        .environmentObject(User())

}
