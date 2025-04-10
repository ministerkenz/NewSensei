// Update DataManager.swift to include laundry steps

import Foundation

class DataManager: ObservableObject {
    @Published var tieSteps: Cardinfo
    @Published var laundrySteps: Cardinfo
    @Published var tirechangeSteps: Cardinfo
    @Published var waterSteps: Cardinfo
    
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
            step19: "Finished"
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
            step18: "Remove clothes from dryer and fold or hang clothes immediately to prevent wrinkles",
            step19: "finished"
        )
        
        self.tirechangeSteps = Cardinfo(
            step1: "Park on a flat, stable surface and turn on hazard lights",
            step2: "Apply the parking brake and place wheel chocks (if available) on the opposite side of the tire you're changing",
            step3: "Take out the spare tire, jack, and lug wrench from your vehicle",
            step4: "Use the flat end of the lug wrench to remove the hubcap (if present)",
            step5: "Loosen the lug nuts by turning counterclockwise with the lug wrench (don't remove them yet)",
            step6: "Position the jack under the vehicle at the recommended lifting point near the flat tire",
            step7: "Raise the jack until it makes contact with the vehicle's frame",
            step8: "Continue jacking up the vehicle until the flat tire is about 6 inches off the ground",
            step9: "Remove the lug nuts completely and place them in a safe location where they won't roll away",
            step10: "Remove the flat tire by pulling it straight toward you",
            step11: "Place the flat tire under the vehicle's frame as a safety precaution in case the jack fails",
            step12: "Line up the spare tire with the wheel bolts and push it into place",
            step13: "Thread the lug nuts back onto the bolts by hand, turning clockwise",
            step14: "Tighten the lug nuts partially with the lug wrench in a star pattern",
            step15: "Lower the vehicle partially by turning the jack handle slowly",
            step16: "Fully tighten all lug nuts with the wrench, using the star pattern again",
            step17: "Lower the vehicle completely and remove the jack",
            step18: "Check that all lug nuts are fully tightened and replace the hubcap if applicable",
            step19: "Finished"
        )
        self.waterSteps = Cardinfo(
            step1: "Gather a graduated cylinder and some water",
            step2: "Choose an object whose volume you want to measure.",
            step3: "Place the cylinder on a flat surface.",
            step4: "Pour water into the cylinder without filling it to the top.",
            step5: "Let the water settle.",
            step6: "Read the water level at eye level.",
            step7: "Record the initial volume of water.",
            step8: "Carefully hold the object above the cylinder.",
            step9: "Gently lower the object into the water.",
            step10: "Avoid splashing or spilling water.",
            step11: "Let the object sink fully and settle.",
            step12: "Check for and wait until all air bubbles are gone.",
            step13: "Read the new water level at eye level.",
            step14: "Record the final volume of water.",
            step15: "Subtract the initial volume from the final volume.",
            step16: "The result is the volume of the object.",
            step17: "Lower the vehicle completely and remove the jack",
            step18: "Remove the object and dry it off.",
            step19: "Finished"
        )
    }
}
