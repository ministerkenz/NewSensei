//
//  CreateContact.swift
//  ContactInfo
//
//  Created by Kenzo Yubitani (student LM) on 11/25/24.
//

import SwiftUI

struct SkillCreation: View {
    @Binding var contact: skillinfo
    @Binding var showSheet: Bool
     
     var body: some View {
         VStack{
             Image(contact.picture)
                 .resizable()
                 .aspectRatio(contentMode: .fit)
                 .clipShape(Circle())
                 .padding()
                 .contrast(contact.contrast)
             TextField("name", text: $contact.name)
                 .font(.title)
                 .padding(.horizontal)
             TextField("Description", text: $contact.requirements)
                 .padding(.horizontal)
                 .keyboardType(.phonePad)
             TextField("Amount of steps", text: $contact.amountofsteps)
                 .padding(.horizontal)
                 .keyboardType(.emailAddress)
           
            
           
             Spacer()
             
             Button(action: {
                 showSheet.toggle()
             }, label: {
                 Text("Save Contact")
             })
             
         }
     }
}

#Preview {
    SkillCreation(contact: Binding.constant(skillinfo()), showSheet: Binding.constant(true))
}
