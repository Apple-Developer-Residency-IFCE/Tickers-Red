//
//  FocusView.swift
//  Tickers
//
//  Created by Ian Pacini on 07/06/23.
//

import SwiftUI

struct SnoreView: View {
    var body: some View {
        HStack {
            VStack {
                Image("snore(1)")
                Image("snore(3)")
            }
            ZStack {
                Image("snore(2)")
            }
        }
    }
}

struct FocusView: View {

    // MARK: - Properties
    private let color = Color(
        red: 59 / 255,
        green: 129 / 255,
        blue: 235 / 255
    )
    let durationInSecond: TimeInterval

    init(durationInSecond: TimeInterval) {
        self.durationInSecond = durationInSecond
    }
    
    var body: some View {
        VStack {
            Text("\(durationInSecond.timeString)")
                .tickerFont(size: 90, weight: .bold)
                .foregroundColor(color)
            SnoreView()
            Image("babyCatAsleepFocus")
        }
    }
}

struct FocusView_Previews: PreviewProvider {
    @State static var timer: TimeInterval = 15
    static var previews: some View {
        FocusView(durationInSecond: timer)
    }
}
