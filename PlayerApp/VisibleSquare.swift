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
            VStack(spacing: 0) {
                Color.black
                Color.white
                Color.black
                Color.white
            }
            VStack(spacing: 0) {
                Color.white
                Color.pink
                Color.yellow
                Color.black
            }
            .overlay {
                dynamicRectangle
                    .blendMode(.destinationOut)
            }
            .compositingGroup()
        }
        .ignoresSafeArea()
    }
    
    var dynamicRectangle: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .frame(width: 100, height: 100)
            .foregroundColor(.white)
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
