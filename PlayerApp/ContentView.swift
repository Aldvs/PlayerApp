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
                HStack(alignment: .center, spacing: 0) {
                    ImageIcon(
                        width: performAnimation ? width : .zero,
                        opacity: performAnimation ? 1 : 0)
                    ImageIcon(
                        width: width,
                        opacity: 1)
                    ImageIcon(
                        width: performAnimation ? 0.5 : width,
                        opacity: performAnimation ? 0 : 1)
                }
                .frame(maxHeight: .infinity, alignment: .center)
            }
        }
//        .buttonStyle(ButtonTapStyle(performAnimation: $performAnimation))
        .frame(maxWidth: 62)
    }
}

//struct ButtonTapStyle: ButtonStyle {
//    @Binding var performAnimation: Bool
//    
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .background(
//                Circle()
//                    .frame(width: 100, height: 100)
//                    .foregroundStyle(.indigo)
//                    .opacity(performAnimation ? 0.1 : 0)
//            
//            )
//            .scaleEffect(performAnimation ? 0.86 : 1)
//            .animation(.smooth(duration: 0.22, extraBounce: 0.6), value: performAnimation)
//    }
//}

struct ImageIcon: View {
    var width: CGFloat
    var opacity: CGFloat
    
    let imageName = "play.fill"
    
    var body: some View {
        Image(systemName: imageName)
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .foregroundStyle(.indigo)
            .frame(width: width)
            .opacity(opacity)
    }
}

#Preview {
    ContentView()
}
