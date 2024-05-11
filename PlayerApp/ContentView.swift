//
//  ContentView.swift
//  PlayerApp
//
//  Created by admin on 09.05.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NextButton()
            .buttonStyle(PressButtonStyle())
    }
}

struct PressButtonStyle: ButtonStyle {
    
    @State private var isProcessingPressBackgroundAnimation: Bool = false
    
    let duration: TimeInterval = 0.4
    let scale: CGFloat = 0.86
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .frame(width: 100, height: 100)
                .foregroundStyle(.gray)
                .opacity(isProcessingPressBackgroundAnimation ? 0.3 : 0)
            configuration.label
                .padding(20)
        }
        .scaleEffect(isProcessingPressBackgroundAnimation ? scale : 1)
        .animation(Animation.easeOut(duration: duration), value: configuration.isPressed)
        .onChange(of: configuration.isPressed) { newValue in
            if newValue {
                withAnimation(Animation.easeOut(duration: duration)) {
                    isProcessingPressBackgroundAnimation = true
                }
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    withAnimation(Animation.easeOut(duration: duration)) {
                        isProcessingPressBackgroundAnimation = false
                    }
                }
            }
        }
        
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

#Preview {
    ContentView()
}
