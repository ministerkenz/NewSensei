import SwiftUI

struct SkillDetailView: View {
    
    @Binding var contact: skillinfo
    @State private var isNavigating = false

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
                    .keyboardType(.phonePad)
                TextField("Amount of steps", text: $contact.amountofsteps)
                    .padding(.horizontal)
                    .keyboardType(.emailAddress)
                
                // NavigationLink triggered by state variable
                NavigationLink(destination: ContentView(), isActive: $isNavigating) {
                    EmptyView()
                }
                
                Button(action: {
                    if contact.name.contains("tie") || contact.name.contains("Tie") {
                        isNavigating = true
                    } else {
                        // For other skills (you could add more specific handling later)
                        isNavigating = true
                    }
                }, label: {
                    Text("Begin")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
            }
            .navigationTitle("Skill Detail")
        }
    }
}

#Preview {
    SkillDetailView(contact: Binding.constant(skillinfo()))
}
