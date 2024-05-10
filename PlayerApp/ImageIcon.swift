//
//  ImageIcon.swift
//  PlayerApp
//
//  Created by admin on 10.05.2024.
//

import SwiftUI

struct ImageIcon: View {
    var width: CGFloat
    var opacity: CGFloat
    
    let imageName = "play.fill"
    
    var body: some View {
        Image(systemName: imageName)
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .foregroundStyle(.orange)
            .frame(width: width)
            .opacity(opacity)
    }
}

#Preview {
    ImageIcon(width: 50, opacity: 1)
}
