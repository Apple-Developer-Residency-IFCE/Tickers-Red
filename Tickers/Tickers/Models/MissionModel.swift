//
//  MissionModel.swift
//  Tickers
//
//  Created by Ian Pacini on 20/06/23.
//

import SwiftUI

struct Mission: Identifiable {
    let id: UUID
    let taskTotal: Int
    let taskResolved: Int
    var color: Color
    let title: String
    let description: String
}
