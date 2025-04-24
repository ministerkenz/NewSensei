import SwiftUI
import FirebaseDatabase
import FirebaseAuth

struct StoreView: View {
    @EnvironmentObject var user: User
    @Binding var accountBackgroundColor: Color
    @Binding var accountBackgroundImage: String?
    @Binding var enoughView: Bool

    let profileImages = ["colt1", "brock", "frank1"]
    let backgroundImages = [nil, "purple1"]

    var body: some View {
        ZStack {
            if(enoughView){
                VStack(alignment: .leading) {
                    Text("Opppps!!")
                    Text("Sorry you don't have enough Gems")
                        .font(.headline)
                        .foregroundColor(.gray)
                    Button(action: {
                        enoughView = false
                    }, label: {
                        Text("Got it")
                    })
                    
                }
                .padding()
                .background(Color.white.opacity(0.8))
                .cornerRadius(15)
                .shadow(radius: 5)
                .padding()
            }
            else{
                // Background
                if let bgImage = accountBackgroundImage {
                    Image(bgImage)
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                } else {
                    accountBackgroundColor
                        .ignoresSafeArea()
                }

                // Make the entire content scrollable
                ScrollView {
                    VStack(alignment: .center) {
                        Text("STORE")
                            .font(.largeTitle)
                            .bold()
                            .padding(.top)

                        // Gem display with enhanced visual
                        HStack {
                            VStack(alignment: .leading) {
                                Text("YOUR GEMS")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                
                                Text("\(user.gems)")
                                    .font(.system(size: 36, weight: .bold))
                                    .foregroundColor(.black)
                            }

                            Spacer()
                            
                            Image("gems1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 60)
                        }
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(15)
                        .shadow(radius: 5)
                        .padding()

                        // Completed skills section
                        VStack(alignment: .leading) {
                            Text("COMPLETED SKILLS")
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding(.bottom, 5)
                            
                            ScrollView {
                                VStack(alignment: .leading, spacing: 10) {
                                    CompletionRow(skillName: "Making a Tie", isCompleted: user.isSkillCompleted(skillType: "tie"))
                                    CompletionRow(skillName: "Doing Laundry", isCompleted: user.isSkillCompleted(skillType: "laundry"))
                                    CompletionRow(skillName: "Changing a Tire", isCompleted: user.isSkillCompleted(skillType: "tirechange"))
                                    CompletionRow(skillName: "Water Displacement Method", isCompleted: user.isSkillCompleted(skillType: "water"))
                                    CompletionRow(skillName: "How to do Homework", isCompleted: user.isSkillCompleted(skillType: "gurt"))
                                    CompletionRow(skillName: "How to get your drivers license", isCompleted: user.isSkillCompleted(skillType: "driver"))
                                    
                                }
                            }
                            .frame(height: 120)
                        }
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(15)
                        .shadow(radius: 3)
                        .padding()
                        
                        // Backgrounds section
                        Text("Backgrounds")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.bottom, 5)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 80) {
                                // Purple background option
                                Button(action: {
                                    accountBackgroundImage = nil
                                    accountBackgroundColor = .purple
                                }) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.purple)
                                        .frame(width: 120, height: 120)
                                        .overlay(
                                            Text("Purple")
                                                .foregroundColor(.white)
                                                .bold()
                                        )
                                        .shadow(radius: 5)
                                }

                                // Default background option
                                Button(action: {
                                    accountBackgroundImage = nil
                                    accountBackgroundColor = .white
                                }) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.white)
                                            .frame(width: 120, height: 120)
                                            .shadow(radius: 5)

                                        Text("Default")
                                            .foregroundColor(.black)
                                            .bold()
                                    }
                                }

                                // Image backgrounds
                                ForEach(backgroundImages.indices, id: \.self) { index in
                                    if let imageName = backgroundImages[index] {
                                        Button(action: {
                                            accountBackgroundImage = imageName
                                        }) {
                                            Image(imageName)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 120, height: 120)
                                                .cornerRadius(10)
                                                .shadow(radius: 5)
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }

                        // Profile selection
                        Text("Choose Your Profile")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.top, 30)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(profileImages, id: \.self) { imageName in
                                    Button(action: {
                                        if (user.gems >= 50){
                                            user.avater = imageName
                                            user.gems = user.gems - 50
                                            
                                            Task {
                                                guard let uid = Auth.auth().currentUser?.uid else { return }
                                                do {
                                                    let ref = Database.database().reference().child("users").child(uid)
                                                    try await ref.setValue(user.encode())
                                                } catch {
                                                    print("❌ Failed to save user data: \(error.localizedDescription)")
                                                }
                                            }
                                        }
                                        else{
                                            enoughView = true
                                        }
                                    }) {
                                        Image(imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 120, height: 120)
                                            .clipShape(Circle())
                                            .overlay(Circle().stroke(user.avater == imageName ? Color.blue : Color.clear, lineWidth: 4))
                                            .shadow(radius: 5)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }

                        // Add extra space at the bottom to ensure scrolling works properly
                        Spacer()
                            .frame(height: 60)
                    }
                    .padding()
                }
            }
        }
    }
}

// Helper component to show completion status
struct CompletionRow: View {
    var skillName: String
    var isCompleted: Bool
    
    var body: some View {
        HStack {
            Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(isCompleted ? .green : .gray)
            
            Text(skillName)
                .foregroundColor(isCompleted ? .black : .gray)
            
            Spacer()
            
            if isCompleted {
                Text("+50")
                    .foregroundColor(.green)
                    .fontWeight(.bold)
                
                Image("gems1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            }
        }
        .padding(.vertical, 5)
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        @State var backgroundColor: Color = .white
        @State var backgroundImage: String? = nil
        @State var enoughView: Bool = false

        return StoreView(
            accountBackgroundColor: $backgroundColor,
            accountBackgroundImage: $backgroundImage,
            enoughView: $enoughView
        )
        .environmentObject(User())
    }
}
