//
//  PomodoroViewModel.swift
//  Tickers
//
//  Created by Oliver Santos on 13/06/23.
//

import SwiftUI

class PomodoroViewModel: ObservableObject {
    @Published var count: Int = 0
    @Published var isRunning: Bool = false
    @Published var progressTimer: Float = 1.0
}

