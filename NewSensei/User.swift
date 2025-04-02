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

    @Published var userName: String = ""

    @Published var tieS: Bool = false

    @Published var shoeS: Bool = false

    @Published var laundryS: Bool = false

    @Published var skill: Int = 0



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
            
            "skill": skill

        ]

        return data

    }

    

    func decode(data: [String: Any]?) {

        

        guard let d = data else {return}

        

        if let userName = d["userName"] as? String{

            self.userName = userName

        }

        

        if let tieS = d["tieS"] as? Bool{

            self.tieS = tieS

        }

        if let shoeS = d["shoeS"] as? Bool{

            self.shoeS = shoeS

        }

        if let laundryS = d["laundryS"] as? Bool{

            self.laundryS = laundryS

        }
        
        if let skill = d["skill"] as? Int{
            self.skill = skill
        }

    }

}

