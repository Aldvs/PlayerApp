//
//  RotatingRow.swift
//  PlayerApp
//
//  Created by admin on 14.05.2024.
//

import SwiftUI

struct CustomSquareView: View {
    let color: Color
    let onTapGesture: () -> Void

    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: 50, height: 50)
            .onTapGesture {
                onTapGesture()
            }
//            .rotationEffect(.degrees(45), anchor: .center)
    }
}

struct RotatingRow: View {
    let numberOfSquares: Int
    let spacing: CGFloat

    var body: some View {
        HStack(spacing: spacing) {
            ForEach(0..<numberOfSquares, id: \.self) { _ in
                CustomSquareView(color: .blue) {
                    // Handle tap gesture
                    print("Square tapped")
                }
            }
        }
//        .rotationEffect(Angle(degrees: -45), anchor: .center)
    }
}

#Preview {
    RotatingRow(numberOfSquares: 7, spacing: 2)
}
