import SwiftUI

struct LaunchView: View {
    var onFinish: () -> Void
    @State private var animateLogo = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: animateLogo ? 900 : 900, height: animateLogo ? 900 : 100)
                .opacity(animateLogo ? 1 : 0)
                .scaleEffect(animateLogo ? 1 : 0.5)
                .animation(.easeOut(duration: 1), value: animateLogo)

            Text("SENSEI")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .opacity(animateLogo ? 1 : 0)
                .animation(.easeOut(duration: 1.2).delay(0.3), value: animateLogo)
        }
        .onAppear {
            animateLogo = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                onFinish()
            }
        }
    }
}


#Preview {
    LaunchView(onFinish: {})
        .environmentObject(User())
}
