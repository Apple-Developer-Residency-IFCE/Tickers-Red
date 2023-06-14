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

    var body: some View {
        HStack(spacing: 0) {
            VStack {
                Image("snore(1)")
                    .offset(x: xOffset * 1.5, y: yOffset * 0.7)
                Image("snore(3)")
                    .offset(x: xOffset * 1.5, y: yOffset * 1.1)
            }
            ZStack {
                Image("snore(2)")
                    .offset(x: xOffset * 1.1, y: yOffset)
            }
        }
        .onAppear {
            withAnimation(.snore) {
                yOffset = 40
                xOffset = 10
            }
        }
    }
}

extension Animation {
    static let snore = Animation
        .easeInOut(duration: 0.75)
        .delay(0.75)
        .repeatForever(autoreverses: true)
}
