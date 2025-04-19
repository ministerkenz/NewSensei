import SwiftUI

struct SkillCompletionStatus: View {
    var skillType: String
    @Binding var isCompleted: Bool
    @EnvironmentObject var user: User
    
    var body: some View {
        VStack(spacing: 1) {
            // Completion toggle
            Toggle("Mark as Completed", isOn: $isCompleted)
                .padding(.horizontal)
                .onChange(of: isCompleted) { newValue in
                    if newValue {
                        withAnimation(.spring()) {
                            user.completeSkill(skillType: skillType)
                        }
                    }
                }
            
            // Success message when completed
            if isCompleted {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                        .font(.title2)
                    
                    Text("Skill completed! You earned 50 gems!")
                        .fontWeight(.semibold)
                        .foregroundColor(.green)
                    
                    Image("gems1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
                .padding()
                .background(Color.green.opacity(0.1))
                .cornerRadius(10)
                .transition(.scale.combined(with: .opacity))
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(15)
        .padding(.horizontal)
    }
}

struct SkillCompletionStatus_Previews: PreviewProvider {
    static var previews: some View {
        SkillCompletionStatus(skillType: "tie", isCompleted: .constant(true))
            .environmentObject(User())
    }
}
