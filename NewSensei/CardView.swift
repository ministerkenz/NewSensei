import SwiftUI

struct CardView: View {
    var step: String
    var onSwipe: (Int) -> Void
    
    @State private var offset: CGSize = .zero
    @State private var isSwipingAway = false

    var body: some View {
        VStack {
            Text(step)
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding()
                .frame(width: 300, height: 200)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.blue.opacity(0.8))
                )
                .foregroundColor(.white)
                .shadow(radius: 5)
                .offset(offset)
                .rotationEffect(.degrees(Double(offset.width / 3000)))
        }
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { gesture in
                    if abs(gesture.translation.width) > 150 {
                        let direction = gesture.translation.width > 0 ? 1 : -1
                        
                        withAnimation(.easeOut(duration: 0.5)) {
                            offset.width = direction > 0 ? 1000 : -1000
                            isSwipingAway = true
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                            onSwipe(direction)
                            withAnimation(.easeOut(duration: 0.3)) {
                                offset = .zero
                                isSwipingAway = false
                            }
                        }
                    } else {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                            offset = .zero
                        }
                    }
                }
        )
    }
}
