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
    
    func completeSkill(skillType: String) {
        if completedSkills[skillType] != true {
            completedSkills[skillType] = true
            gems += 50
            saveUserData()
        }
    }
    
    func isSkillCompleted(skillType: String) -> Bool {
        return completedSkills[skillType] == true
    }
    
    func saveUserData() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let ref = Database.database().reference().child("users").child(uid)
        try? ref.setValue(self.encode())
    }
    
    func encode() -> [String: Any] {
        return [
            "userName": userName,
            "email": email,
            "gems": gems,
            "avater" : avater,
            "completedSkills": completedSkills
        ]
    }
    
    func decode(data: [String: Any]) {
        self.userName = data["userName"] as? String ?? "User"
        self.email = data["email"] as? String ?? ""
        self.gems = data["gems"] as? Int ?? 0
        self.completedSkills = data["completedSkills"] as? [String: Bool] ?? [:]
        self.avater = data["avater"] as? String ?? "colt1"
    }
}
