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
    @State private var remainingTime: [Time] = [Time(remainigTime: 1800, typeTimer: true), Time(remainigTime: 300, typeTimer: false)]
    @State private var isRunning: Bool = false
    @State private var progressTimer: Double = 1
    let timerProgress: Double = 1800
    @State var count: Int = 0;
    
    var progress: Double {
        timerProgress/(3600 * (timerProgress))
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
                if remainingTime[count].remainigTime > 0 {
                    progressTimer -= progress
                    remainingTime[count].remainigTime -= 1
                } else {
                    progressTimer = 1
                }
            }
            isRunning = true
        }
    }
    
    func onSkip() -> Void {
            count += 1
        
    }
    
    var body: some View {
        ZStack{
            Image("ellipse")
                .resizable()
                .padding(.bottom, -50)
                .padding(.top, 380)
            VStack {
                 Text(remainingTime[count].typeTimer ? "Pomodoro" : "Pausa")
                    .tickerFont(size: 22, weight: .bold)
                    .foregroundColor(color)
                    .padding(.bottom, -30)
                TimerView(durationInSecond: remainingTime[count].remainigTime, isTimerRunning: isRunning, progressTimer: progressTimer, onReset: onReset, onPlayPause: onPlayPause, onSkip: onSkip)
                if(remainingTime[count].typeTimer){
                    HStack(spacing: 20){
                        Image("football").padding(.bottom, -60).padding(.leading, 10)
                        Image("babyCatAwake").padding(.bottom, 90).padding(.trailing, 50)
                    }.padding(.bottom, 10)
                }else{
                    VStack(spacing: 20){
                        Image("sleepZZZ").padding(.bottom, -80).padding(.leading, 140)
                        Image("babyCatAsleepTimer").padding(.bottom, 40)
                    }.padding(.bottom, 10)
                }
                
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
