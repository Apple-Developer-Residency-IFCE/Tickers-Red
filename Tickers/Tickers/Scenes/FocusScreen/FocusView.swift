//
//  FocusView.swift
//  Tickers
//
//  Created by Ian Pacini on 07/06/23.
//

import SwiftUI

struct FocusView: View {
    
    // MARK: - Properties
    let durationInSecond: TimeInterval

    @State private var yOffset: CGFloat = 0
    
    init(durationInSecond: TimeInterval) {
        self.durationInSecond = durationInSecond
    }
    
    // MARK: - View
    var body: some View {
        VStack {
            durationText
            animatedSnoreView
            sleepingCatImage
        }
    }
    
    // MARK: - Functions
    private var durationText: some View {
        Text("\(durationInSecond.timeString)")
            .tickerFont(size: 90, weight: .bold)
            .foregroundColor(.customBlue)
    }
    
    private var animatedSnoreView: some View {
        SnoreView()
            .onAppear {
                withAnimation(.snore) {
                    yOffset = 20
                }
            }
    }
    
    private var sleepingCatImage: some View {
        Image("babyCatAsleepFocus")
            .offset(y: yOffset)
    }
}

// MARK: - Preview
struct FocusView_Previews: PreviewProvider {
    @State static var timer: TimeInterval = 15
    static var previews: some View {
        FocusView(durationInSecond: timer)
    }
}
