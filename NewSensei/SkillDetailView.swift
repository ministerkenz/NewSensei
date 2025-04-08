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
                    // Determine which skill to navigate to based on the contact's picture property
                    selectedSkill = contact.picture // Use the picture property directly as it matches our skill types
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
            .onAppear {
                // Ensure selectedSkill is set correctly when view appears
                selectedSkill = contact.picture
            }
        }
    }
}

#Preview {
    SkillDetailView(contact: Binding.constant(skillinfo()))
}
