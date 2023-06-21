//
//  FocusContentView.swift
//  Tickers
//
//  Created by Alley Pereira on 20/06/23.
//

import SwiftUI

struct FocusContentView: View {
    let durationInSecond: TimeInterval
    
    @State private var yOffset: CGFloat = 0
    @State private var scale: CGFloat = 0
    
    var body: some View {
        VStack {
            durationText
            animatedSnoreView
            sleepingCatImage
        }
        .scaleEffect(scale)
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                yOffset = 20
                scale = 1
            }
        }
    }
    
    // MARK: - Functions
    private var durationText: some View {
        Text("\(durationInSecond.timeString)")
            .tickerFont(size: 90, weight: .bold)
            .foregroundColor(.customBlue)
            .scaleEffect(scale)
    }
    
    private var animatedSnoreView: some View {
        SnoreView()
    }
    
    private var sleepingCatImage: some View {
        Image("babyCatAsleepFocus")
            .offset(y: yOffset)
            .scaleEffect(scale)
    }
}
