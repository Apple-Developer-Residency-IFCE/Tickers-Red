//
//  SnoreView.swift
//  Tickers
//
//  Created by Alley Pereira on 13/06/23.
//

import SwiftUI

struct SnoreView: View {
    
    @State private var yOffset: CGFloat = 0
    @State private var xOffset: CGFloat = 0
    
    private let snores = ["snore(1)", "snore(3)", "snore(2)"]
    
    var body: some View {
        HStack(spacing: 0) {
            VStack {
                ForEach(0..<2) { index in
                    snoreImage(named: snores[index], x: xOffset * 1.5, y: yOffset * (index == 0 ? 0.7 : 1.1))
                }
            }
            ZStack {
                snoreImage(named: snores[2], x: xOffset * 1.1, y: yOffset)
            }
        }
        .onAppear {
            animateImages()
        }
    }
    
    // MARK: - Functions
    private func snoreImage(named name: String, x: CGFloat, y: CGFloat) -> some View {
        Image(name)
            .offset(x: x, y: y)
    }
    
    private func animateImages() {
        withAnimation(.snore) {
            yOffset = 40
            xOffset = 10
        }
    }
}

extension Animation {
    static let snore = Animation
        .easeInOut(duration: 0.75)
        .delay(0.75)
        .repeatForever(autoreverses: true)
}
