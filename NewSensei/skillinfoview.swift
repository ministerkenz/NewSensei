//
//  ContactView.swift
//  ContactInfo
//
//  Created by Kenzo Yubitani (student LM) on 11/11/24.
//

import SwiftUI

struct skillinfoview: View {
    
    @State var contacts : [skillinfo] = [
        skillinfo(name:"Tie", phone: "1111111111", email: "sara@gmail.com", picture: "tie"),
        skillinfo(name:"indoor", phone: "2222222222", email: "bob@gmail.com", picture: "house"),
        skillinfo(name:"outdoor", phone: "3333333333", email: "mansor@gmail.com", picture: "tirechange"),
        skillinfo(name:"outdoor", phone: "4444444444", email: "kai@gmail.com", picture: "tirechange"),
        skillinfo(name:"Ethan", phone: "5555555555", email: "ethan@gmail.com", picture: "idris"),
        skillinfo(name:"Kate", phone: "6666666666", email: "kate@gmail.com", picture: "bob"),
        skillinfo(name:"Grace", phone: "7777777777", email: "grace@gmail.com", picture: "linda")
        
    ]
    
    
    var body: some View {
        TabView {
            Navigation(contacts: $contacts)
                .tabItem {
                    Image(systemName: "person")
                    Text("contacts")
                }
            Text("keypad")
                .tabItem {
                    Image(systemName: "circle.grid.3x3.fill")
                    Text("keypad")
                }
            Text("good job")
                .tabItem {
                    Image(systemName: "hand.thumbsup.fill")
                    Text("good job")
                }
            
        }
        
    }
}

#Preview {
    skillinfoview()
        .environmentObject(User())
}
