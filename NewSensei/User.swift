//
//  User.swift
//  Sensei
//
//  Created by Paul Han (student LM) on 2/26/25.
//

import Foundation

class User: ObservableObject{
    @Published var email: String
    @Published var password: String
    @Published var isUserAuthenticated: Bool = false
    
    init(email: String = "", password: String = "") {
        self.email = email
        self.password = password
    }
}
