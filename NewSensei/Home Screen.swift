import SwiftUI

struct Home_Screen: View {
    @State private var accountBackgroundColor: Color = .white
    @State private var accountBackgroundImage: String? = nil
    @State private var profileImage: String = "colt1" 
    @State private var navigateToHome = false
    @State private var enoughView = false

    @State var contacts: [skillinfo] = [
        skillinfo(name: "Making a Tie", picture: "tie", requirements: "You need a tie to learn this essential skill", amountofsteps: "19"),
        skillinfo(name: "Doing Laundry", picture: "laundry", requirements: "You need some dirty clothes, washing machine, detergent, and dryer or drying rack", amountofsteps: "19"),
        skillinfo(name: "Changing a Tire", picture: "tirechange", requirements: "You need a car, spare tire, jack, and lug wrench", amountofsteps: "19"),
        skillinfo(name: "Water displacement method", picture: "water", requirements: "2 measurement beakers, water, and an object", amountofsteps: "19")
        
    ]

    @EnvironmentObject var user: User

    var body: some View {
        NavigationView {
            VStack {
                Text("SENSEI")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)

                Text("Learn Essential Life Skills")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom)

                TabView {
                    // Home Tab
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(0..<contacts.count, id: \.self) { index in
                                NavigationLink(destination: SkillDetailView(contact: $contacts[index])) {
                                    HStack {
                                        Image(contacts[index].picture)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 100, height: 100)
                                            .clipShape(Circle())

                                        VStack(alignment: .leading) {
                                            Text(contacts[index].name)
                                                .font(.headline)

                                            Text(contacts[index].requirements)
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                                .lineLimit(2)

                                            Text("\(contacts[index].amountofsteps) steps")
                                                .font(.caption)
                                                .padding(.top, 5)
                                        }
                                        .padding(.leading)

                                        Spacer()
                                    }
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 2)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding()
                    }
                    .tabItem { Label("Home", systemImage: "house.fill") }

                    
                    ProgressView(progress1: .constant(0.55),
                                 backgroundColor: $accountBackgroundColor,
                                 backgroundImage: $accountBackgroundImage,
                                 navigateToHome: $navigateToHome)
                        .tabItem { Label("Account", systemImage: "person.crop.circle.fill") }

                    // Store Tab
                    StoreView(accountBackgroundColor: $accountBackgroundColor,
                              accountBackgroundImage: $accountBackgroundImage,
                              profileImage: $profileImage,
                              enoughView: $enoughView)
                        .tabItem { Label("Store", systemImage: "bag.fill") }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    Home_Screen()
        .environmentObject(User())
}
