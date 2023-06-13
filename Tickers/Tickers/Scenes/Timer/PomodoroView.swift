//
//  PomodoroView.swift
//  Tickers
//
//  Created by userext on 31/05/23.
//

import SwiftUI



struct PomodoroView: View {
    @State var timeList: TimeList?
//    @State private var isRunning: Bool = false
//    @State private var progressTimer: Float = 1.0
//    @State var count: Int
    @ObservedObject var viewModel: PomodoroViewModel
    let listTime: TimeList
    
    
    init(listTime: TimeList){
        self.listTime = listTime
        self._timeList = State(initialValue: listTime)
        self.viewModel = PomodoroViewModel()
    }
    
    private let color = Color(
        red: 59 / 255,
        green: 129 / 255,
        blue: 235 / 255
    )
    
    func reset(){
        timeList?.time[viewModel.count].timer?.invalidate()
        timeList?.time[viewModel.count].timer = nil
        viewModel.isRunning = false
    }
    
    func onReset() {
        timeList?.time[viewModel.count].remainigTime = listTime.time[viewModel.count].remainigTime
        reset()
    }
    
    func onPlayPause() {
        
        if !viewModel.isRunning {
            let totalTime = timeList?.time[viewModel.count].remainigTime // Tempo total inicial
            timeList?.time[viewModel.count].timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if ((timeList?.time[viewModel.count].remainigTime)! > 0) {
                    timeList?.time[viewModel.count].remainigTime -= 1
                    let remainingTime = timeList?.time[viewModel.count].remainigTime
                    viewModel.progressTimer = (1 - (Float(totalTime!) - Float(remainingTime!)) / Float(totalTime!)) // Calcula o progresso com base no valor atual do timerValue (60 segundos)
                } else {
                    progressTimer = 1.0
                }
            }
            viewModel.isRunning = true
        } else {
            reset()
        }
    }
    
    func onSkip() -> Void {
        if (timeList!.time.count > (viewModel.count + 1)) {
            
            reset()
            viewModel.count += 1
            progressTimer = 1.0
            
        }else{
            
            reset()
            viewModel.count -= 1
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
                Text(timeList!.time[viewModel.count].typeTimer ? "Pomodoro" : "Pausa")
                    .tickerFont(size: 22, weight: .bold)
                    .foregroundColor(color)
                    .padding(.bottom, -30)
                TimerView(durationInSecond: timeList!.time[viewModel.count].remainigTime, isTimerRunning: viewModel.isRunning, progressTimer: progressTimer, onReset: onReset, onPlayPause: onPlayPause, onSkip: onSkip)
                tickersPomodoroView
                footerView
            }
        }
    }
    
    private var tickersPomodoroView: some View {
        VStack{
            if(timeList!.time[viewModel.count].typeTimer){
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
        }
    }
    
    private var footerView: some View {
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
        } // HStack
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
