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
    @Published var isShowingPopup: Bool = false
    var achievementViewModel: AchievementViewModel?
    
    let listTime: [Time]
    
    init(timeList: [Time], achievementViewModel: AchievementViewModel? = nil) {
        self.listTime = timeList
        self.timeList = timeList
        self.achievementViewModel = achievementViewModel
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

                    // Atualiza o xpAtual no AchievementViewModel
                    let minutesPassed = (totalTime - remainingTime) / 60
                    if let firstAchievement = self.achievementViewModel?.achievements.first {
                        let xpPerMinute = firstAchievement.xpAtual
                        let xpGained = xpPerMinute * Float(minutesPassed)
//                        self.achievementViewModel?.updateXP(minutes: Int(xpGained))
//                        self.achievementViewModel?.saveAchievement(id: UUID(), xpAtual: <#T##Float#>, xpTotal: <#T##Float#>, isCompleted: <#T##Bool#>)
                    } else {
                        print("⚠ xpPerMinute it's NULL")
                    }
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
            onReset()
            count += 1
            progressTimer = 1.0
            
        } else{
            onReset()
            count -= 1
            progressTimer = 1.0
        }
    }
    
    func isCurrentTimerRest() -> Bool {
        return listTime[count].isRest
    }

}
