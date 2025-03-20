//
//  Cardinfo.swift
//  NewSensei
//
//  Created by Kenzo Yubitani (student LM) on 3/13/25.
//

import Foundation


struct Cardinfo: Identifiable {
    let id = UUID()
    var step1 : String
    var step2 : String
    var step3 : String
    var step4 : String
    var step5 : String
    var step6 : String
    var step7 : String
    var step8 : String
    var step9 : String
    var step10 : String
    var step11 : String
    var step12 : String
    var step13 : String
    var step14 : String
    var step15 : String
    var step16 : String
    var step17 : String
    var step18 : String
    var step19 : String
   
    
    init(step1: String = "tie", step2: String = "tie", step3: String = "tie", step4: String = "tie", step5: String = "tie", step6: String = "tie", step7: String = "tie", step8: String = "tie", step9: String = "tie", step10: String = "tie", step11: String = "tie", step12: String = "tie", step13: String = "tie", step14: String = "tie", step15: String = "tie", step16: String = "tie", step17: String = "tie", step18: String = "tie", step19: String = "tie") {
        self.step1 = step1
        self.step2 = step2
        self.step3 = step3
        self.step4 = step4
        self.step5 = step5
        self.step6 = step6
        self.step7 = step7
        self.step8 = step8
        self.step9 = step9
        self.step10 = step10
        self.step11 = step11
        self.step12 = step12
        self.step13 = step13
        self.step14 = step14
        self.step15 = step15
        self.step16 = step16
        self.step17 = step17
        self.step18 = step18
        self.step19 = step19
    }
    
}

