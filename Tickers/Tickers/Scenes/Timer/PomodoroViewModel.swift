//
//  PomodoroViewModel.swift
//  Tickers
//
//  Created by Oliver Santos on 13/06/23.
//

import SwiftUI

class PomodoroViewModel: ObservableObject {
    @Published var timeList: [Time]
    @Published var count: Int = 0
    @Published var isRunning: Bool = false
    @Published var progressTimer: Float = 1.0
    
    let listTime: [Time]
    
    init(timeList: [Time]) {
        self.listTime = timeList
        self.timeList = timeList
    }
    
    func reset() {
        timeList[count].timer?.invalidate()
        timeList[count].timer = nil
        isRunning = false
    }
    
    func onReset() {
        timeList[count].remainigTime = self.listTime[count].remainigTime
        reset()
    }
    
    func onPlayPause() {
        
        if !isRunning {
            let totalTime = timeList[count].remainigTime // Tempo total inicial
            timeList[count].timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if ((self.timeList[self.count].remainigTime) > 0) {
                    self.timeList[self.count].remainigTime -= 1
                    let remainingTime = self.timeList[self.count].remainigTime
                    self.progressTimer = (1 - (Float(totalTime) - Float(remainingTime)) / Float(totalTime)) // Calcula o progresso com base no valor atual do timerValue (60 segundos)
                } else {
                    self.progressTimer = 1.0
                }
            }
            isRunning = true
        } else {
            reset()
        }
    }
    
    func onSkip() {
        if (timeList.count > (count + 1)) {
            reset()
            count += 1
            progressTimer = 1.0
            
        }else{
            reset()
            count -= 1
            progressTimer = 1.0
        }
        
    }
}

