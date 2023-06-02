//
//  PomodoroView.swift
//  Tickers
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct PomodoroView: View {
    @State private var timer: Timer? = nil
    @State private var remainingTime: TimeInterval = 60
    @State private var isRunning: Bool = false
    @State private var progressTimer: Double = 1
    let tinerProgress: Double = 60
    
    var progress: Double {
        tinerProgress/3600
    }
    
    private let color = Color(
        red: 59 / 255,
        green: 129 / 255,
        blue: 235 / 255
    )
    
    func onReset() {
        timer?.invalidate()
        timer = nil
        isRunning = false
    }
    
    func onPlayPause() {
        
        if isRunning {
            onReset()
        } else {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if remainingTime > 0 {
                    progressTimer -= progress
                    remainingTime -= 1
                } else {
                    progressTimer = 1
                    onReset()
                }
            }
            isRunning = true
        }
    }
    
    func onSkip() -> Void {
    }
    
    var body: some View {
        ZStack{
            Image("ellipse")
                .resizable()
                .padding(.bottom, -50)
                .padding(.top, 380)
            VStack {
                Text("Pomodoro")
                    .tickerFont(size: 22, weight: .bold)
                    .foregroundColor(color)
                    .padding(.bottom, -30)
                TimerView(durationInSecond: remainingTime, isTimerRunning: isRunning, progressTimer: progressTimer, onReset: onReset, onPlayPause: onPlayPause, onSkip: onSkip)
            }
        }
    }
}

struct PomodoroView_Previews: PreviewProvider {
    static var previews: some View {
        PomodoroView()
    }
}
