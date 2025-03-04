import SwiftUI

struct Home_Screen: View {
    @State var contacts: [skillinfo] = [
        skillinfo(name: "Making a tie", picture: "tie"),
        skillinfo(name: "Doing some laundry", picture: "laundry", requirements: "you need some dirty clothes, washing machine soap, and probably a washing machine", amountofsteps: "16"),
        skillinfo(name: "Changing your tire", picture: "tirechange", requirements: "you need a car, another tire, and whatever they use to change it", amountofsteps: "23")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("HOME PAGE")
                
                TabView(selection: .constant(1)) {
                    HStack {
                        NavigationLink(destination: SkillDetailView(contact: $contacts[1])) {
                            Image("house")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 125, height: 500)
                                .clipped()
                        }
                        NavigationLink(destination: SkillDetailView(contact: $contacts[0])) {
                            Image("tie")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 125, height: 500)
                                .clipped()
                        }
                        NavigationLink(destination: SkillDetailView(contact: $contacts[2])) {
                            Image("tirechange")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 125, height: 500)
                                .clipped()
                        }
                    }
                    .tabItem { Label("Home", systemImage: "house.fill") }
                    .tag(1)
                    
                    Text("ACCOUNT PAGE")
                        .tabItem { Label("Account", systemImage: "person.crop.circle.fill") }
                        .tag(2)
                    
                    Text("Store")
                        .tabItem { Label("Store", systemImage: "bag.fill") }
                        .tag(3)
                }
            }
        }
    }
}

#Preview {
    Home_Screen()
}
