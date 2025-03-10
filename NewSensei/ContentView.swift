//
//  ContentView.swift
//  NewSensei
//
//  Created by Kenzo Yubitani (student LM) on 3/4/25.
//

import SwiftUI

struct ContentView: View {
    @State private var currentIndex: Int = 0
    private let steps: [String] = ["Step 1", "Step 2", "Step 3", "Step 4"]

    var body: some View {
        VStack {
            ZStack {
                if currentIndex < steps.count {
                    CardView(step: steps[currentIndex], onSwipe: { direction in
                        handleSwipe(direction: direction)
                    })
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }
            .padding()
            .animation(.easeInOut, value: currentIndex)

            HStack {
                Button("Back") {
                    if currentIndex > 0 {
                        currentIndex -= 1
                    }
                }
                .disabled(currentIndex == 0)
                .padding()
                
                Button("Next") {
                    if currentIndex < steps.count - 1 {
                        currentIndex += 1
                    }
                }
                .disabled(currentIndex >= steps.count - 1)
                .padding()
            }
        }
    }

    private func handleSwipe(direction: Int) {
        if direction > 0 && currentIndex < steps.count - 1 {
            currentIndex += 1
        } else if direction < 0 && currentIndex > 0 {
            currentIndex -= 1
        }
    }
}

#Preview {
    ContentView()
}




/*
import SwiftUI

struct ContentView: View {
    
    var daysToCheck : [String]
    
    private let cardOffset : CGFloat = 24
    private let cardRatio : CGFloat = 1.333
    private let cardOffsetMultiplier : CGFloat = 4
    private let cardAlphaStep : Double = 0.1
    
    private var yCardOffset: CGFloat{
        return -CGFloat(daysToCheck.count) * cardOffset / 2
    }
    private func calculateCardWidth(geo:
        GeometryProxy,offset:CGFloat, cardIndex: Int)->CGFloat{
        return geo.size.width - ((offset * 2) * CGFloat(cardIndex))
    }
    private func calculateCardYOffset(offset:CGFloat,cardIndex:Int) ->CGFloat {
        return offset * CGFloat(cardIndex)
    }
    private func calculateItemInvertIndex(arr:[String],item:String)->Int{
        if arr.isEmpty{return 0}
        return arr.count - 1 - arr.firstIndex(of: item)!
    }
    private func calculateCardAlpha (cardIndex : Int)->Double{
        return 1.0 - Double(cardIndex) * cardAlphaStep
    }
    
    var body: some View {
        VStack{
            GeometryReader{geometry in
                VStack{
                    Spacer()
                    ZStack{
                        ForEach(daysToCheck, id :\.self){
                            day in
                            CardView(day: day,cardAlpha:
                            calculateCardAlpha(cardIndex:
                            calculateItemInvertIndex(arr: daysToCheck, item: day)))
                            .frame(width:calculateCardWidth(geo: geometry, offset: cardOffset, cardIndex: calculateItemInvertIndex(arr: daysToCheck, item: day)),height: geometry.size.width * cardRatio)
                            .offset(x: 0 , y: calculateCardYOffset(offset: cardOffset, cardIndex: calculateItemInvertIndex(arr: daysToCheck, item: day)) * cardOffsetMultiplier)
                        }
                        
                    }
                    .offset(y: yCardOffset)
                    Spacer()
                }
            }
        }
        .padding(cardOffset)
        .background(Color("Accent"))
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView(daysToCheck: days)
}
*/
