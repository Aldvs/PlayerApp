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
    @State private var startTime: Date?
    @State private var elapsedTime: TimeInterval = 0.0
    @State private var moreThanDuration: Bool = false
    
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
                startTime = Date()
            } else {
                if let startTime = startTime {
                    elapsedTime = Date().timeIntervalSince(startTime)
                }
                moreThanDuration = elapsedTime > duration
                DispatchQueue.main.asyncAfter(deadline: .now() + (moreThanDuration ? 0 : duration)) {
                    withAnimation(Animation.easeOut(duration: duration)) {
                        isProcessingPressBackgroundAnimation = false
                    } completion: {
                        resetTime()
                    }
                }
            }
        }
    }
    
    private func resetTime() {
        startTime = nil
        elapsedTime = 0.0
        moreThanDuration = false
    }
}

#Preview {
    ContentView()
}
