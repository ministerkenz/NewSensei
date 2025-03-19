//
//  ContentView.swift
//  NewSensei
//
//  Created by Kenzo Yubitani (student LM) on 3/4/25.
//Make it a carousel type cards

import SwiftUI

struct ContentView: View {
    @State private var currentIndex: Int = 0
    private let steps: [String] = ["Step 1", "Step 2", "Step 3", "Step 4"]

    var body: some View {
        VStack {
            ZStack {
                if currentIndex < steps.count {
                    CardView(step: steps[currentIndex], onSwipe: { direction in
                        handleSwipe(direction: direction)
                    })
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }
            .padding()
            .animation(.easeInOut, value: currentIndex)

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

#Preview {
    ContentView()
}




