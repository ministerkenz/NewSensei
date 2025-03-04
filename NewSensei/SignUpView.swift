//
//  SignUpView.swift
//  Sensei
//
//  Created by Paul Han (student LM) on 2/26/25.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @EnvironmentObject var user: User
    var body: some View {
        ZStack{
            Rectangle()
            .foregroundColor(.white)
            VStack{
                Spacer()
                Text("Welcome to Sensei")
                    .font(.title)
                Spacer()
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
                            .foregroundColor(.black)
                            .underline()
                })
                }.padding(.bottom, 60)
            }
        }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
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
        }catch let e as Error{
            print(e)
        }
    }
}

#Preview {
    SignUpView()
        .environmentObject(User())

}
