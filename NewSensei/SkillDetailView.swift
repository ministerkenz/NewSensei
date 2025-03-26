import SwiftUI

struct SkillDetailView: View {
    
    @Binding var contact: skillinfo
    @State private var isNavigating = false
    @State private var selectedSkill = "tie" // Default to tie
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(contact.picture)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .padding()
                    .contrast(contact.contrast)
                
                TextField("Name", text: $contact.name)
                    .font(.title)
                    .padding(.horizontal)
                
                TextField("Description", text: $contact.requirements)
                    .padding(.horizontal)
                
                TextField("Amount of steps", text: $contact.amountofsteps)
                    .padding(.horizontal)
                
                // NavigationLink triggered by state variable
                NavigationLink(destination: ContentView(skillType: selectedSkill), isActive: $isNavigating) {
                    EmptyView()
                }
                
                Button(action: {
                    // Determine which skill to navigate to
                    if contact.name.lowercased().contains("tie") {
                        selectedSkill = "tie"
                    } else if contact.name.lowercased().contains("laundry") {
                        selectedSkill = "laundry"
                    } else {
                        selectedSkill = "tie" // Default fallback
                    }
                    isNavigating = true
                }, label: {
                    Text("Begin")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
                .padding()
            }
            .navigationTitle("Skill Detail")
        }
    }
}

#Preview {
    SkillDetailView(contact: Binding.constant(skillinfo()))
}
