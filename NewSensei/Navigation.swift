//
//  Navigation.swift
//  Sensei
//
//  Created by Kenzo Yubitani (student LM) on 2/26/25.
//

import SwiftUI

struct Navigation: View {
    
    @Binding var contacts : [skillinfo]
    @State var showSheet: Bool = false
    
    var body: some View {
        NavigationView{
            List($contacts) { $contact in
                NavigationLink {
                   SkillDetailView(contact: $contact)
                } label: {
                    Text(contact.name)
                }
            }
            .navigationTitle("Contacts")
                .navigationBarItems(trailing: Button(action: {
                    contacts.append(skillinfo(name: "", phone: "", email: ""))
                    showSheet.toggle()
                }, label: {
                    Text("+")
                        .font(.largeTitle)
                    
                }))
        }.sheet(isPresented: $showSheet, content: {
            SkillCreation(contact: $contacts[contacts.count - 1], showSheet: $showSheet)
            
        })
    }
}

#Preview {
    Navigation(contacts: Binding.constant([skillinfo(), skillinfo()]))
}
