import Foundation
import FirebaseAuth
import FirebaseDatabase

class User: ObservableObject {
    @Published var userName: String = "Change your Username"
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var gems: Int = 0
    @Published var avater: String = "colt1"
    @Published var isUserAuthenticated: Bool = false
    @Published var completedSkills: [String: Bool] = [:]
    
    // Mark a skill as completed and award gems
    func completeSkill(skillType: String) {
        // Only award gems if skill hasn't been completed before
        if completedSkills[skillType] != true {
            completedSkills[skillType] = true
            gems += 50
            saveUserData()
        }
    }
    
    // Check if a skill is completed
    func isSkillCompleted(skillType: String) -> Bool {
        return completedSkills[skillType] == true
    }
    
    // Save user data to Firebase
    func saveUserData() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let ref = Database.database().reference().child("users").child(uid)
        try? ref.setValue(self.encode())
    }
    
    // Encode user data for saving to Firebase
    func encode() -> [String: Any] {
        return [
            "userName": userName,
            "email": email,
            "gems": gems,
            "avater" : avater,
            "completedSkills": completedSkills
        ]
    }
    
    // Decode user data from Firebase
    func decode(data: [String: Any]) {
        self.userName = data["userName"] as? String ?? "User"
        self.email = data["email"] as? String ?? ""
        self.gems = data["gems"] as? Int ?? 0
        self.completedSkills = data["completedSkills"] as? [String: Bool] ?? [:]
        self.avater = data["avater"] as? String ?? "colt1"
    }
}
