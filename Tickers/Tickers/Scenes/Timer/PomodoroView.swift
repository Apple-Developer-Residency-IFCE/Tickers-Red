//
//  PomodoroView.swift
//  Tickers
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct PomodoroView: View {
    @ObservedObject var viewModel: PomodoroViewModel
    @Environment(\.dismiss) var dismiss
    
    init(listTime: [Time]){
        self.viewModel = PomodoroViewModel(timeList: listTime)
    }
    
    private let color = Color(
        red: 59 / 255,
        green: 129 / 255,
        blue: 235 / 255
    )
    
    var body: some View {
        NavigationView {
            ZStack{
                Image("ellipse")
                    .resizable()
                    .padding(.bottom, -50)
                    .padding(.top, 380)
                VStack {
                    TimerView(durationInSecond: viewModel.timeList[viewModel.count].remainigTime, isTimerRunning: viewModel.isRunning, progressTimer: viewModel.progressTimer, onReset: viewModel.onReset, onPlayPause: viewModel.onPlayPause, onSkip: viewModel.onSkip)
                    tickersPomodoroView
                    footerView
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(viewModel.timeList[viewModel.count].isPomodoro ? "Pomodoro" : "Pausa")
                        .tickerFont(size: 22, weight: .bold)
                        .foregroundColor(color)
//                        .padding(.bottom, -30)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "plus")
                        .foregroundColor(color)
                        .font(.system(size: 25))
                        .rotationEffect(.degrees(45))
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
        } // ZStack
    }
    
    private var tickersPomodoroView: some View {
        VStack{
            if(viewModel.timeList[viewModel.count].isPomodoro){
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
        } // VStack
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
        PomodoroView(listTime: [
            Time(remainigTime: 1500, isPomodoro: true),
            Time(remainigTime: 300, isPomodoro: false)
        ])
    }
}
