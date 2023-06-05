//
//  PomodoroView.swift
//  Tickers
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct Time: Codable{
    var remainigTime: TimeInterval
    var typeTimer: Bool
}

struct TimeList: Codable {
    var time: [Time]
}

struct PomodoroView: View {
    @State private var timer: Timer? = nil
    @State private var remainingTime: Time = Time(remainigTime: 60, typeTimer: true)
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
                if remainingTime.remainigTime > 0 {
                    progressTimer -= progress
                    remainingTime.remainigTime -= 1
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
                TimerView(durationInSecond: remainingTime.remainigTime, isTimerRunning: isRunning, progressTimer: progressTimer, onReset: onReset, onPlayPause: onPlayPause, onSkip: onSkip)
                HStack(spacing: 20){
                    Image("football").padding(.bottom, -60).padding(.leading, 10)
                    Image("babyCatAwake").padding(.bottom, 90).padding(.trailing, 50)
                }.padding(.bottom, 10)
                HStack(alignment: .bottom, spacing: 50){
                    VStack(alignment: .center){
                        Image("focusButton")
                        Text("Foco")
                            .tickerFont(size: 18, weight: .bold)
                            .foregroundColor(color)
                    }
                    VStack(alignment: .center){
                        Image("hourglassWPencil")
                        Text("Definições")
                            .tickerFont(size: 18, weight: .bold)
                            .foregroundColor(color)
                    }
                    VStack(alignment: .center){
                        Image("sounds")
                        Text("Sons")
                            .tickerFont(size: 18, weight: .bold)
                            .foregroundColor(color)
                    }
                }
            }
        }
    }
}

struct PomodoroView_Previews: PreviewProvider {
    static var previews: some View {
        PomodoroView()
    }
}
