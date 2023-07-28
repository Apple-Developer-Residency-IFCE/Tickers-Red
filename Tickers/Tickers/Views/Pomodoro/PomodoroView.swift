//
//  PomodoroView.swift
//  Tickers
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct PomodoroView: View {
    @ObservedObject var pomodoroViewModel: PomodoroViewModel
    @ObservedObject var popupFactory: PomodoroPopupFactory
    @State var isPresentingDefinitions: Bool = false
    @Environment(\.dismiss) var dismiss
    
    init(listTime: [Time]) {
        let vm = PomodoroViewModel(timeList: listTime)
        self.pomodoroViewModel = vm
        self.popupFactory = PomodoroPopupFactory(viewModel: vm)
    }
    
    var body: some View {
        NavigationView {
            ZStack{
                Image("ellipse")
                    .resizable()
                    .padding(.bottom, -50)
                    .padding(.top, 380)
                VStack {
                    TimerView(
                        durationInSecond: pomodoroViewModel.timeList[pomodoroViewModel.count].remainigTime,
                        isTimerRunning: pomodoroViewModel.isRunning,
                        progressTimer: pomodoroViewModel.progressTimer,
                        onReset: { popupFactory.show(.reset) },
                        onPlayPause: { pomodoroViewModel.onPlayPause() },
                        onSkip: {
                            if pomodoroViewModel.isCurrentTimerRest() {
                                popupFactory.show(.skipRest)
                            } else {
                                popupFactory.show(.skipPomo)
                            }
                        }
                    )
                    tickersPomodoroView
                    footerView
                }
                
                if pomodoroViewModel.isShowingPopup {
                    popupFactory.make()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(pomodoroViewModel.timeList[pomodoroViewModel.count].isPomodoro ? "Pomodoro" : "Pausa")
                        .tickerFont(size: 22, weight: .bold)
                        .foregroundColor(Color("Blue2"))
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "plus")
                        .foregroundColor(Color("MainBlue"))
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
            if(pomodoroViewModel.timeList[pomodoroViewModel.count].isPomodoro){
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
            NavigationLink(destination: FocusView(durationInSecond: pomodoroViewModel.timeList[pomodoroViewModel.count].remainigTime)) {
                VStack(alignment: .center){
                    Image("focusButton")
                    Text("Foco")
                        .tickerFont(size: 18, weight: .bold)
                        .foregroundColor(Color("Blue2"))
                }
            }
            VStack(alignment: .center){
                Image("hourglassWPencil")
                Text("Definições")
                    .tickerFont(size: 18, weight: .bold)
                    .foregroundColor(Color("Blue2"))
            }.onTapGesture {
                isPresentingDefinitions = true
            }
            .sheet(isPresented: $isPresentingDefinitions) {
                DefinitionsView(isPresentingDefinitions: $isPresentingDefinitions)
            }
            NavigationLink(destination: SoundsView(sounds: SoundViewModel())) {
                VStack(alignment: .center){
                    Image("sounds")
                    Text("Sons")
                        .tickerFont(size: 18, weight: .bold)
                        .foregroundColor(Color("Blue2"))
                }
            }
        } // HStack
    }
    
}

struct PomodoroView_Previews: PreviewProvider {
    static var previews: some View {
        PomodoroView(listTime: [
            Time(remainigTime: 1500, isPomodoro: true, isRest: true),
            Time(remainigTime: 300, isPomodoro: false, isRest: false)
        ])
    }
}
