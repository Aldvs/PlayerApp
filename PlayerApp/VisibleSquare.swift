//
//  VisibleSquare.swift
//  PlayerApp
//
//  Created by admin on 11.05.2024.
//

import SwiftUI

struct VisibleSquare: View {
    @State private var offset = CGSize.zero
    var body: some View {
        ZStack {
            VStack(spacing: .zero) {
                Rectangle()
                    .foregroundStyle(.white)
                Rectangle()
                    .foregroundStyle(.pink)
                Rectangle()
                    .foregroundStyle(.yellow)
                Rectangle()
                    .foregroundStyle(.black)
            }
            dynamicRectangle
                .foregroundColor(.black)
                .blendMode(.difference)
                .overlay(dynamicRectangle.blendMode(.hue))
                .overlay(dynamicRectangle.foregroundColor(.white).blendMode(.overlay))
                .overlay(dynamicRectangle.foregroundColor(.black).blendMode(.overlay))
        }
        .ignoresSafeArea()
    }
    
    var dynamicRectangle: some View {
        Rectangle()
            .frame(width: 100, height: 100)
            .foregroundColor(.black)
            .colorInvert()
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        self.offset = gesture.translation
                    }
                    .onEnded { _ in
                    }
            )
    }
}

#Preview {
    VisibleSquare()
}
