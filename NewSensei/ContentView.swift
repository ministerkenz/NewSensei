// ContentView.swift
import SwiftUI

struct ContentView: View {
    @StateObject private var dataManager = DataManager()
    @State private var currentIndex: Int = 0
    
    // Computed property to get all steps as array
    private var steps: [String] {
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

    var body: some View {
        VStack {
            // Display current step number
            Text("Step \(currentIndex + 1) of \(steps.count)")
                .font(.headline)
                .padding(.top)
            
            ZStack {
                if currentIndex < steps.count {
                    CardView(step: steps[currentIndex], onSwipe: { direction in
                        handleSwipe(direction: direction)
                    })
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
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
                
                Button("Next") {
                    if currentIndex < steps.count - 1 {
                        currentIndex += 1
                    }
                }
                .disabled(currentIndex >= steps.count - 1)
                .padding()
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
