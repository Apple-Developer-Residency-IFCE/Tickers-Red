//
//  AchievementModel.swift
//  Tickers
//
//  Created by Julia Morales on 29/06/23.
//

import SwiftUI

struct AchievementModel: Hashable {
    let isCompleted: Bool
    let isProgressive: Bool
    let taskTotal: Int
    var taskResolved: Int
    let title: String
    let description: String
    
}
