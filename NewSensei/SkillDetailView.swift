import SwiftUI

struct SkillDetailView: View {
    
   @Binding var contact: skillinfo
    
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
          
            Button(action: {
                //brings us to the next thing
                NavigationLink(destination: SkillDetailView(contact: $contact)) {
                }
                
            }, label: {
                Text("Begin")
            })
            
           
            
        }
    }
}

#Preview {
    SkillDetailView(contact: Binding.constant(skillinfo()))
}
