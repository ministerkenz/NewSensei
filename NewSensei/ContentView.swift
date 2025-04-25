import SwiftUI

struct ContentView: View {
    var skillType: String
    
    @StateObject private var dataManager = DataManager()
    @State private var currentStep = 0
    @State private var showCompletionButton = false
    @State private var isSkillCompleted = false
    
    @EnvironmentObject var user: User
    
    var skillSteps: Cardinfo {
        switch skillType {
        case "tie":
            return dataManager.tieSteps
        case "laundry":
            return dataManager.laundrySteps
        case "tirechange":
            return dataManager.tirechangeSteps
        case "water":
            return dataManager.waterSteps
        case "gurt":
            return dataManager.homeworkSteps
        case "driver":
            return dataManager.licenseSteps
        case "youtube":
            return dataManager.youtuberSteps
        default:
            return dataManager.tieSteps
        }
    }
    
    var steps: [String] {
        var result: [String] = []
        for i in 1...19 {
            let mirror = Mirror(reflecting: skillSteps)
            if let stepValue = mirror.children.first(where: { $0.label == "step\(i)" })?.value as? String {
                result.append(stepValue)
            }
        }
        return result
    }
    
    func goToNextStep() {
        if currentStep < steps.count - 1 {
            currentStep += 1
        }
        
        // Show completion button when reaching the last step
        if currentStep == steps.count - 1 {
            showCompletionButton = true
        }
    }
    
    func goToPreviousStep() {
        if currentStep > 0 {
            currentStep -= 1
        }
    }
    
    func handleSwipe(_ direction: Int) {
        if direction > 0 {
            goToPreviousStep()
        } else {
            goToNextStep()
        }
    }
    
    // Get the image name for the current step (simplified format: "tie1", "tie2", etc.)
    func getStepImageName() -> String {
        return "\(skillType)\(currentStep + 1)"
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text(getSkillTitle())
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                // Step counter
                Text("Step \(currentStep + 1) of \(steps.count)")
                    .font(.headline)
                    .padding(.bottom)
                
                // Step image with simplified naming convention
                Image(getStepImageName())
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.gray.opacity(0.1))
                    )
                    .padding()
                
                // Swipeable card
                CardView(step: steps[currentStep], onSwipe: handleSwipe)
                    .padding()
                
                // Navigation buttons
                HStack {
                    Button(action: goToPreviousStep) {
                        HStack {
                            Image(systemName: "arrow.left")
                            Text("Previous")
                        }
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                    }
                    .disabled(currentStep == 0)
                    
                    Spacer()
                    
                    Button(action: goToNextStep) {
                        HStack {
                            Text("Next")
                            Image(systemName: "arrow.right")
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .disabled(currentStep == steps.count - 1)
                }
                .padding(.horizontal)
                
                // Completion button shown on the last step
                if showCompletionButton {
                    VStack {
                        Toggle("Mark as Completed", isOn: $isSkillCompleted)
                            .padding()
                            .onChange(of: isSkillCompleted) { newValue in
                                if newValue {
                                    user.completeSkill(skillType: skillType)
                                }
                            }
                        
                        if isSkillCompleted {
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
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
                        }
                    }
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                    .padding()
                }
                
                // Add some extra space at the bottom for scrolling on the final step
                if showCompletionButton {
                    Spacer()
                        .frame(height: 60)
                }
            }
        }
        .onAppear {
            isSkillCompleted = user.isSkillCompleted(skillType: skillType)
            
            if currentStep == steps.count - 1 {
                showCompletionButton = true
            }
        }
    }
    
    // Helper to get skill title from skill type
    private func getSkillTitle() -> String {
        switch skillType {
        case "tie":
            return "How to Tie a Tie"
        case "laundry":
            return "How to Do Laundry"
        case "tirechange":
            return "How to Change a Tire"
        case "water":
            return "Water Displacement Method"
        default:
            return "Skill Tutorial"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(skillType: "tie")
            .environmentObject(User())
    }
}

