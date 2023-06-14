//
//  FocusView.swift
//  Tickers
//
//  Created by Ian Pacini on 07/06/23.
//

import SwiftUI

struct FocusView: View {
    
    // MARK: - Properties
    private let color = Color(
        red: 59 / 255,
        green: 129 / 255,
        blue: 235 / 255
    )
    let durationInSecond: TimeInterval
    @State private var yOffset: CGFloat = 0
    
    init(durationInSecond: TimeInterval) {
        self.durationInSecond = durationInSecond
    }
    
    // MARK: - View
    var body: some View {
        VStack {
            Text("\(durationInSecond.timeString)")
                .tickerFont(size: 90, weight: .bold)
                .foregroundColor(color)
            SnoreView()
                .onAppear {
                    withAnimation(.snore) {
                        yOffset = 20
                    }
                }
            Image("babyCatAsleepFocus")
                .offset(y: yOffset)
        }
    }
}

// MARK: - Preview
struct FocusView_Previews: PreviewProvider {
    @State static var timer: TimeInterval = 15
    static var previews: some View {
        FocusView(durationInSecond: timer)
    }
}
