//
//  SwiftUIView.swift
//  Tickers
//
//  Created by Ian Pacini on 15/06/23.
//

import SwiftUI

// MARK: - TickersViewModel
class TickersViewModel: ObservableObject {
    @Published var tickers = [
        Ticker(id: 1, isLocked: false, actualProgress: 29, totalProgress: 30, tickerLevel: 1, tickerImage: "babyCatAwake", tickerEgg: "eggBlue", tickerName: "Joaozinho"),
        Ticker(id: 2, isLocked: true, actualProgress: 0, totalProgress: 1, tickerLevel: 0, tickerImage: "babyCatAwake", tickerEgg: "eggBlue", tickerName: "Caiozinho"),
        Ticker(id: 3, isLocked: true, actualProgress: 0, totalProgress: 1, tickerLevel: 0, tickerImage: "babyCatAwake", tickerEgg: "eggRed", tickerName: "Lucaszinho"),
        Ticker(id: 4, isLocked: true, actualProgress: 0, totalProgress: 1, tickerLevel: 0, tickerImage: "babyCatAwake", tickerEgg: "eggYellow", tickerName: "Julinha"),
        Ticker(id: 5, isLocked: true, actualProgress: 0, totalProgress: 1, tickerLevel: 0, tickerImage: "babyCatAwake", tickerEgg: "eggGreen", tickerName: "Alleeyzinha"),
        Ticker(id: 6, isLocked: true, actualProgress: 0, totalProgress: 1, tickerLevel: 0, tickerImage: "babyCatAwake", tickerEgg: "eggPink", tickerName: "Vanessinha")
    ]
}

// MARK: - AchievementViewModel
class AchievementHomeViewModel: ObservableObject {
    @Published var achievements = [
        AchievementHomeModel(id: UUID(), isLocked: true, title: "Hora do Foco", subtitle: "Concluiu seu primeiro Pomodoro"),
        AchievementHomeModel(id: UUID(), isLocked: false, title: "Hora do Foco", subtitle: "Concluiu seu primeiro Pomodoro"),
        AchievementHomeModel(id: UUID(), isLocked: true, title: "Hora do Foco", subtitle: "Concluiu seu primeiro Pomodoro"),
        AchievementHomeModel(id: UUID(), isLocked: false, title: "Hora do Foco", subtitle: "Concluiu seu primeiro Pomodoro"),
        
    ]
}
