//
//  Achievements.swift
//  Tickers
//
//  Created by Alley Pereira on 20/07/23.
//

import SwiftUI

class Achievements {
    let tickerName: String
    let xpRequiredByLevel: [Int: Int]
    
    init(tickerName: String, xpRequiredByLevel: [Int : Int]) {
        self.tickerName = tickerName
        self.xpRequiredByLevel = xpRequiredByLevel
    }
    
    /// Determina o level desbloqueado com base na quantidade de XP ganho
    func unlockedLevel(xp: Int) -> Int {
        var unlockedLevel = 1
        
        for (level, xpRequired) in xpRequiredByLevel {
            if (xp >= xpRequired) {
                unlockedLevel = level
            }
        }
        return unlockedLevel
    }
    
}

// MARK: - Sistema de Achievements do Tickers
struct TickerAchievementsByLevel {

    let xpRequiredByLevels = [
        "Ticker 1": [1: 20, 2: 45],
        "Ticker 2": [1: 75, 2: 120],
        "Ticker 3": [1: 100, 2: 265],
        "Ticker 4": [1: 360, 2: 485],
        "Ticker 5": [1: 630, 2: 810],
        "Ticker 6": [1: 1020, 2: 1170],
    ]
    
}
