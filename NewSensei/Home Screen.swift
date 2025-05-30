import SwiftUI

struct Home_Screen: View {
    @State private var accountBackgroundColor: Color = .white
    @State private var accountBackgroundImage: String? = nil
    @State private var enoughView: Bool = false
    @Binding var navigateToHome:Bool

    @EnvironmentObject var user: User

    @State var contacts: [skillinfo] = [
        skillinfo(name: "Tying a Tie", picture: "tie", requirements: "You need a tie to learn this essential skill", amountofsteps: "19"),
        skillinfo(name: "Doing Laundry", picture: "laundry", requirements: "You need some dirty clothes, washing machine, detergent, and dryer or drying rack", amountofsteps: "19"),
        skillinfo(name: "Changing a Tire", picture: "tirechange", requirements: "You need a car, spare tire, jack, and lug wrench", amountofsteps: "19"),
        skillinfo(name: "Water Displacement Method", picture: "water", requirements: "2 measurement beakers, water, and an object", amountofsteps: "19"),
        skillinfo(name: "How To Do Homework", picture: "gurt", requirements: "Your homework", amountofsteps: "19"),
        skillinfo(name: "How To Get Your Drivers License", picture: "driver", requirements: "A car", amountofsteps: "19"),
        skillinfo(name: "How To Become an Youtuber", picture: "youtube", requirements: "A laptop", amountofsteps: "19")
    ]

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Header
                VStack {
                    Text("SENSEI")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top)

                    Text("Learn Essential Life Skills")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom, 5)
                }
                .background(Color.white)
                .zIndex(1)

                // TabView with 3 sections
                TabView {
                    // Home Tab
                    VStack(spacing: 0) {
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

                                Spacer()
                                    .frame(height: 40)
                            }
                            .padding()
                        }
                        .background(Color(UIColor.systemGroupedBackground))
                    }
                    .tabItem { Label("Home", systemImage: "house.fill") }

                    // Account/Progress Tab
                    ProgressView(
                        backgroundColor: $accountBackgroundColor,
                        backgroundImage: $accountBackgroundImage, navigateToHome: $navigateToHome
                    )
                    .tabItem { Label("Account", systemImage: "person.crop.circle.fill") }

                    // Store Tab
                    StoreView(accountBackgroundColor: $accountBackgroundColor,
                              accountBackgroundImage: $accountBackgroundImage,
                              enoughView: $enoughView)
                    .tabItem { Label("Store", systemImage: "bag.fill") }
                }
                .edgesIgnoringSafeArea(.bottom)
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    let mockUser = User()
    mockUser.completedSkills = ["tie": true, "laundry": true, "tire": true]

    return Home_Screen(navigateToHome:.constant(false))
        .environmentObject(mockUser)
}
