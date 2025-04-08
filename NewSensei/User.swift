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

    @Published var userName: String = "Enter Your User Name"

    @Published var tieS: Int = 0

    @Published var shoeS: Int = 0

    @Published var laundryS: Int = 0

    @Published var gems: Int = 25



    init(email: String = "", password: String = "") {

        self.email = email

        self.password = password

    }

    

    func encode() -> [String: Any]{

        let data : [String: Any] = [

            "userName": userName,

            "tieS": tieS,

            "shoeS": shoeS,

            "laundryS": laundryS,
            
            "gems": gems

        ]

        return data

    }

    

    func decode(data: [String: Any]?) {

        

        guard let d = data else {return}

        

        if let userName = d["userName"] as? String{

            self.userName = userName

        }

        

        if let tieS = d["tieS"] as? Int{

            self.tieS = tieS

        }

        if let shoeS = d["shoeS"] as? Int{

            self.shoeS = shoeS

        }

        if let laundryS = d["laundryS"] as? Int{

            self.laundryS = laundryS

        }
        
        if let gems = d["gems"] as? Int{
            self.gems = gems
        }

    }

}

