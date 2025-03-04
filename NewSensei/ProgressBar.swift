//
//  ProgressBar.swift
//  Sensei
//
//  Created by Aarav Gupta (student LM) on 2/28/25.
//

import SwiftUI

struct ProgressBar: View {
    @State var progress: CGFloat = 0.55
    var width:CGFloat = 300
    var height:CGFloat = 25
    var CRadius:CGFloat = 20
    var body: some View {
        ZStack(alignment:.leading) {
            RoundedRectangle(cornerRadius: CRadius)
                .frame(width: width + 5, height: height + 5)
                .foregroundColor(.blue)
            RoundedRectangle(cornerRadius: CRadius)
                .frame(width: progress * width, height: height)
                .offset(x:2)
        }
    }
}

#Preview {
    ProgressBar()
}
