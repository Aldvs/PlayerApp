//
//  NextButton.swift
//  PlayerApp
//
//  Created by admin on 10.05.2024.
//

import SwiftUI

struct NextButton: View {
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
        .frame(maxWidth: 62)
    }
}

#Preview {
    NextButton()
}
