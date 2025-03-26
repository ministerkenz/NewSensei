// ContentView.swift
import SwiftUI

struct ContentView: View {
    @StateObject private var dataManager = DataManager()
    @State private var currentIndex: Int = 0
    var skillType: String = "tie" // Default to tie skill
    
    // Computed property to get all steps as array based on skill type
    private var steps: [String] {
        switch skillType.lowercased() {
        case "laundry":
            return [
                dataManager.laundrySteps.step1,
                dataManager.laundrySteps.step2,
                dataManager.laundrySteps.step3,
                dataManager.laundrySteps.step4,
                dataManager.laundrySteps.step5,
                dataManager.laundrySteps.step6,
                dataManager.laundrySteps.step7,
                dataManager.laundrySteps.step8,
                dataManager.laundrySteps.step9,
                dataManager.laundrySteps.step10,
                dataManager.laundrySteps.step11,
                dataManager.laundrySteps.step12,
                dataManager.laundrySteps.step13,
                dataManager.laundrySteps.step14,
                dataManager.laundrySteps.step15,
                dataManager.laundrySteps.step16,
                dataManager.laundrySteps.step17,
                dataManager.laundrySteps.step18,
                dataManager.laundrySteps.step19
            ]
        default: // "tie" or any other default
            return [
                dataManager.tieSteps.step1,
                dataManager.tieSteps.step2,
                dataManager.tieSteps.step3,
                dataManager.tieSteps.step4,
                dataManager.tieSteps.step5,
                dataManager.tieSteps.step6,
                dataManager.tieSteps.step7,
                dataManager.tieSteps.step8,
                dataManager.tieSteps.step9,
                dataManager.tieSteps.step10,
                dataManager.tieSteps.step11,
                dataManager.tieSteps.step12,
                dataManager.tieSteps.step13,
                dataManager.tieSteps.step14,
                dataManager.tieSteps.step15,
                dataManager.tieSteps.step16,
                dataManager.tieSteps.step17,
                dataManager.tieSteps.step18,
                dataManager.tieSteps.step19
            ]
        }
    }
    
    // Computed property to get skill title
    private var skillTitle: String {
        return skillType.capitalized
    }
    
    // Get the image for the current step
    private var currentStepImage: String {
        switch skillType.lowercased() {
        case "tie":
            return "tie\(currentIndex + 1)"
        case "laundry":
            return "laundry\(currentIndex + 1)"
        default:
            return "tie\(currentIndex + 1)"
        }
    }

    var body: some View {
        VStack {
            // Display current skill and step
            Text("\(skillTitle) - Step \(currentIndex + 1) of \(steps.count)")
                .font(.headline)
                .padding(.top)
            
            ZStack {
                if currentIndex < steps.count {
                    VStack {
                        // Add image for current step if available
                        Image(currentStepImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(15)
                            .padding()
                        
                        CardView(step: steps[currentIndex], onSwipe: { direction in
                            handleSwipe(direction: direction)
                        })
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                    }
                } else {
                    Text("Tutorial Completed!")
                        .font(.title)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.green))
                }
            }
            .padding()
            .animation(.easeInOut, value: currentIndex)

            // Progress indicator
            ProgressBar(progress: CGFloat(currentIndex) / CGFloat(steps.count - 1))
                .padding()
            
            HStack {
                Button("Back") {
                    if currentIndex > 0 {
                        currentIndex -= 1
                    }
                }
                .disabled(currentIndex == 0)
                .padding()
                .background(currentIndex > 0 ? Color.blue : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button("Next") {
                    if currentIndex < steps.count - 1 {
                        currentIndex += 1
                    }
                }
                .disabled(currentIndex >= steps.count - 1)
                .padding()
                .background(currentIndex < steps.count - 1 ? Color.blue : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
    }

    private func handleSwipe(direction: Int) {
        if direction > 0 && currentIndex < steps.count - 1 {
            currentIndex += 1
        } else if direction < 0 && currentIndex > 0 {
            currentIndex -= 1
        }
    }
}
