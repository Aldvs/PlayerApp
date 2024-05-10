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
