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
