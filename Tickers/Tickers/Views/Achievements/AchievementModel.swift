//
//  AchievementModel.swift
//  Tickers
//
//  Created by Julia Morales on 04/07/23.
//

import Foundation

struct AchievementModel: Hashable {
    let isCompleted: Bool
    let isProgressive: Bool
    let taskTotal: Int
    var taskResolved: Int
    let title: String
    let description: String
}

class Achievements: Identifiable {
    let id: UUID
    var tickerName: String
    var xpRequiredByLevel: [Int: Int]
    var xpTotal: Int
    var xpAtual: Int
    var isCompleted: Bool {
        return xpAtual >= xpTotal
    }
    
    init(id: UUID = UUID(), tickerName: String, xpRequiredByLevel: [Int: Int]) {
        self.id = id
        self.tickerName = tickerName
        self.xpRequiredByLevel = xpRequiredByLevel
        self.xpTotal = 0
        self.xpAtual = 0
    }
}
