//
//  ContentView.swift
//  PlayerApp
//
//  Created by admin on 09.05.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var performAnimation = false
    
    var body: some View {
        Button {
            if !performAnimation {
                withAnimation(Animation.spring(duration: 0.5, bounce: 0.5)) {
                    performAnimation = true
                } completion: {
                    performAnimation = false
                }
            }
        } label: {
            GeometryReader { proxy in
                let width = proxy.size.width / 2
                let imageName = "play.fill"
                HStack(alignment: .center, spacing: 0) {
                    Image(systemName: imageName)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: performAnimation ? width : .zero)
                        .opacity( performAnimation ? 1 : 0)
                    Image(systemName: imageName)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: width)
                    Image(systemName: imageName)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: performAnimation ? 0.5 : width)
                        .opacity( performAnimation ? 0 : 1)
                }
                .frame(maxHeight: .infinity, alignment: .center)
                .border(.black, width: 2)
            }
        }
        .frame(maxWidth: 62)
        .border(.purple, width: 1)
    }
}

#Preview {
    ContentView()
}
