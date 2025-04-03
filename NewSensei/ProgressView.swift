import SwiftUI

struct ProgressView: View {
    @Binding var progress1: CGFloat // Binding for progress (progress is a CGFloat)
    @Binding var backgroundColor: Color
    @Binding var backgroundImage: String?
    @Binding var profileImage: String

    var body: some View {
        ZStack {
            // Background color/image
            if let backgroundImage = backgroundImage {
                Image(backgroundImage)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            } else {
                backgroundColor
                    .ignoresSafeArea()
            }

            VStack {
                Spacer()
                Image(profileImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                Spacer()
                Spacer()
                Spacer()

                VStack {
                    Text("Progress Bar")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top)

                    ProgressBar(progress: progress1)
                        .padding()
                }
                .padding()
                .background(Color.black.opacity(0.5))
                .cornerRadius(10)

                Spacer()
            }
            .padding(.bottom, 40)
        }
    }
}

#Preview {
    ProgressView(progress1: .constant(0.55),
                 backgroundColor: .constant(.white),
                 backgroundImage: .constant(nil),
                 profileImage: .constant("colt1"))
}
