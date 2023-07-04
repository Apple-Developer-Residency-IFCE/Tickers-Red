//
//  File.swift
//  Tickers
//
//  Created by Ian Pacini on 20/06/23.
//

import SwiftUI

class MissionsViewModel: ObservableObject {
    @Published var missions = [
                            Mission(id: UUID(), taskTotal: 1, taskResolved: 0, color: .init("Salmon"), title: "Primeira vez", description: "Finalize seu primeiro pomodoro do dia e ganhe 50 de exp."),
                            Mission(id: UUID(), taskTotal: 2, taskResolved: 1, color: .init("Pink"), title: "Foco total", description: "Finalize dois pomodoros usando a funçao foco e ganhe um novo som."),
                            Mission(id: UUID(), taskTotal: 4, taskResolved: 1, color: .init("Blue2"), title: "Ninguem e de ferro", description: "Complete 4 pomodoros em sequencia.")
                            ]
}
