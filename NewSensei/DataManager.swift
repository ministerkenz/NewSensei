// Update DataManager.swift to include laundry steps

import Foundation

class DataManager: ObservableObject {
    @Published var tieSteps: Cardinfo
    @Published var laundrySteps: Cardinfo
    
    init() {
        self.tieSteps = Cardinfo(
            step1: "Place the tie around your neck with the wide end on your right side, hanging about double below the narrow end",
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
            step12: "Adjust the length if needed",
            step13: "Check that the narrow end is tucked into the tie keeper loop",
            step14: "Straighten your collar over the tie",
            step15: "Look in the mirror to ensure symmetry",
            step16: "Tighten slightly if needed",
            step17: "Make any final adjustments",
            step18: "Your tie is now perfectly knotted",
            step19: "Finish"
        )
        
        self.laundrySteps = Cardinfo(
            step1: "Sort your clothes by color (whites, darks, colors)",
            step2: "Check pockets and remove any items",
            step3: "Turn clothes inside out to protect colors and prints",
            step4: "Check clothing care labels for special instructions",
            step5: "Treat any stains before washing",
            step6: "Open the washing machine lid or door",
            step7: "Load clothes loosely into the machine, don't overfill",
            step8: "Add detergent to the dispenser or directly into drum",
            step9: "Add fabric softener if desired (optional)",
            step10: "Select appropriate cycle based on fabric type",
            step11: "Choose water temperature (cold for colors, warm/hot for whites)",
            step12: "Close lid/door and start the machine",
            step13: "Wait for cycle to complete",
            step14: "Remove clothes promptly after cycle finishes",
            step15: "Shake clothes to reduce wrinkles before drying",
            step16: "Transfer to dryer or hang to air dry",
            step17: "For dryer: clean lint filter, select appropriate heat setting",
            step18: "Remove clothes from dryer when slightly damp to reduce wrinkles",
            step19: "Fold or hang clothes immediately to prevent wrinkles"
        )
    }
}
