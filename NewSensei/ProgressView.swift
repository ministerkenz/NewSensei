import SwiftUI

struct ProgressView: View {
    @State private var firstImage = "colt1"
    @State private var secondImage = "brock"
    @State private var progress: Double = 0.0
    @Binding var progress1: ProgressBar
    
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.background1
                    .ignoresSafeArea(.all)
                VStack {
                    HStack {
                        NavigationLink(destination: SecondView(firstImage: $firstImage, secondImage: $secondImage)) {
                            Image(firstImage)
                                .resizable()
                                .padding()
                                .frame(width: 200, height: 200, alignment: .topTrailing)
                        }
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

struct SecondView: View {
    @Binding var firstImage: String
    @Binding var secondImage: String
    
    var body: some View {
        ZStack {
            Color.background1
                .ignoresSafeArea()
            VStack {
                Text("Change your avatar")
                Button(action: {
                    
                    let temp = firstImage
                    firstImage = secondImage
                    secondImage = temp
                }) {
                    Image(secondImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .padding()
                }
                
            }
        }
        
    }
}

#Preview {
    ProgressView(progress1: Binding.constant(ProgressBar()))
}
