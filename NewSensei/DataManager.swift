

// DataManager.swift
import Foundation

class DataManager: ObservableObject {
    @Published var tieSteps: Cardinfo
    
    init() {
        // Initialize with your tie-making steps
        self.tieSteps = Cardinfo(
            step1: "Place the tie around your neck with the wide end on your right side, hanging about 12 inches below the narrow end",
            step2: "Cross the wide end over the narrow end",
            step3: "Bring the wide end up through the loop between your collar and the tie",
            step4: "Bring the wide end down and to the left",
            step5: "Pass the wide end horizontally across the front of the narrow end, from left to right",
            step6: "Bring the wide end up through the loop again",
            step7: "Pass the wide end down through the knot in front",
            step8: "Hold the front of the knot with one hand while tightening with the other",
            step9: "Adjust the tie by sliding the knot up",
            step10: "Center the knot between your collar points",
            step11: "Make sure the tie is straight and even",
            step12: "Adjust the length if needed - the tip should reach your belt buckle",
            step13: "Check that the narrow end is tucked into the tie keeper loop",
            step14: "Straighten your collar over the tie",
            step15: "Look in the mirror to ensure symmetry",
            step16: "Tighten slightly if needed",
            step17: "Make any final adjustments",
            step18: "Your tie is now perfectly knotted",
            step19: "Practice makes perfect!"
        )
    }
}
