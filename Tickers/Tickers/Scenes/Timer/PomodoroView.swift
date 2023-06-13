//
//  PomodoroView.swift
//  Tickers
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct Time {
    var timer: Timer?
    var remainigTime: TimeInterval
    var typeTimer: Bool
}

struct TimeList {
    var time: [Time]
}

struct PomodoroView: View {
    @State var timeList: TimeList?
    @State private var isRunning: Bool = false
    @State private var progressTimer: Float = 1.0
    @State var count: Int = 0;
    let listTime: TimeList
    
    
    init(listTime: TimeList){
        self.listTime = listTime
        self._timeList = State(initialValue: listTime)
    }
    
    private let color = Color(
        red: 59 / 255,
        green: 129 / 255,
        blue: 235 / 255
    )
    
    func reset(){
        timeList?.time[count].timer?.invalidate()
        timeList?.time[count].timer = nil
        isRunning = false
    }
    
    func onReset() {
        timeList?.time[count].remainigTime = listTime.time[count].remainigTime
        reset()
    }
    
    func onPlayPause() {
        
        if !isRunning {
            let totalTime = timeList?.time[count].remainigTime // Tempo total inicial
            timeList?.time[count].timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if ((timeList?.time[count].remainigTime)! > 0) {
                    timeList?.time[count].remainigTime -= 1
                    let remainingTime = timeList?.time[count].remainigTime
                    progressTimer = (1 - (Float(totalTime!) - Float(remainingTime!)) / Float(totalTime!)) // Calcula o progresso com base no valor atual do timerValue (60 segundos)
                } else {
                    progressTimer = 1.0
                }
            }
            isRunning = true
        } else {
            reset()
        }
    }
    
    func onSkip() -> Void {
        if (timeList!.time.count > (count + 1)) {
            
            reset()
            count += 1
            progressTimer = 1.0
            
        }else{
            
            reset()
            count -= 1
            progressTimer = 1.0
        }
        
    }
    
    var body: some View {
        ZStack{
            Image("ellipse")
                .resizable()
                .padding(.bottom, -50)
                .padding(.top, 380)
            VStack {
                Text(timeList!.time[count].typeTimer ? "Pomodoro" : "Pausa")
                    .tickerFont(size: 22, weight: .bold)
                    .foregroundColor(color)
                    .padding(.bottom, -30)
                TimerView(durationInSecond: timeList!.time[count].remainigTime, isTimerRunning: isRunning, progressTimer: progressTimer, onReset: onReset, onPlayPause: onPlayPause, onSkip: onSkip)
                if(timeList!.time[count].typeTimer){
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
        PomodoroView(listTime: TimeList(time: [
            Time(remainigTime: 1500, typeTimer: true),
            Time(remainigTime: 300, typeTimer: false)
        ]))
    }
}
