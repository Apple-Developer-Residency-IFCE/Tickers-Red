//
//  AchievementSystem.swift
//  Tickers
//
//  Created by Alley Pereira on 20/07/23.
//

import SwiftUI

class AchievementSystem {
    struct Achievement {
        let tickerName: String
        let xpRequiredByLevel: [Int: Int]

        /// Determina o level desbloqueado com base na quantidade de XP ganho
        func unlockedLevel(xp: Int) -> Int {
            var unlockedLevel = 1

            for (level, xpRequired) in xpRequiredByLevel.sorted(by: { $0.key < $1.key }) {
                if xp >= xpRequired {
                    unlockedLevel = level
                } else {
                    break
                }
            }
            return unlockedLevel
        }
    }

    private let tickerAchievementsByLevel: [String: [Int: Int]]

    init() {
        tickerAchievementsByLevel = [
            "Ticker 1": [1: 20, 2: 45],
            "Ticker 2": [1: 75, 2: 120],
            "Ticker 3": [1: 100, 2: 265],
            "Ticker 4": [1: 360, 2: 485],
            "Ticker 5": [1: 630, 2: 810],
            "Ticker 6": [1: 1020, 2: 1170]
        ]
    }

    func getAchievements() -> [Achievement] {
        var achievements: [Achievement] = []

        for (tickerName, xpRequiredByLevel) in tickerAchievementsByLevel {
            let achievement = Achievement(tickerName: tickerName, xpRequiredByLevel: xpRequiredByLevel)
            achievements.append(achievement)
        }

        return achievements
    }

    func getUnlockedTickers(xpGained: Int) -> [String: Int] {
        let achievementsList = getAchievements()
        var unlockedTickers: [String: Int] = [:]

        for achievement in achievementsList {
            let unlockedLevel = achievement.unlockedLevel(xp: xpGained)
            if unlockedLevel > 1 {
                unlockedTickers[achievement.tickerName] = unlockedLevel
            }
        }

        return unlockedTickers
    }
}
