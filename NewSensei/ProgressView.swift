import SwiftUI

struct ProgressView: View {
    @State private var progress: Double = 0.0
    @Binding var progress1: ProgressBar
    var backgroundColor: Color
    var backgroundImage: String?
    var profileImage: String

    var body: some View {
        NavigationStack {
            ZStack {
                if let bgImage = backgroundImage {
                    Image(bgImage)
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                } else {
                    backgroundColor
                        .ignoresSafeArea()
                }

                VStack {
                    HStack {
                        Image(profileImage)
                            .resizable()
                            .padding()
                            .frame(width: 200, height: 200, alignment: .topTrailing)

                        VStack {
                            Text("NAME")
                                .bold()
                                .font(.title)
                            Text("Skill: ??")
                                .bold()
                                .font(.title)
                        }
                        Spacer()
                    }
                    .padding()

                    ProgressBar()

                    Text("\(Int(200 - progress)) points left")
                        .font(.headline)
                        .bold()
                        .padding(.top, 5)
                }
                .padding()
            }
        }
    }
}

#Preview {
    ProgressView(progress1: Binding.constant(ProgressBar()),
                 backgroundColor: .white,
                 backgroundImage: nil,
                 profileImage: "colt1")
}
