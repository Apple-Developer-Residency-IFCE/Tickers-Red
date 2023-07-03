//
//  AchievementModel.swift
//  Tickers
//
//  Created by Alley Pereira on 03/07/23.
//

import Foundation

struct AchievementHomeModel: Identifiable {
    let id: UUID
    let isLocked: Bool
    let title: String
    let subtitle: String
}
