//
//  TickersApp.swift
//  Tickers
//
//  Created by Lucas Oliveira on 23/05/23.
//

import SwiftUI

@main
struct TickersApp: App {
    var body: some Scene {
        WindowGroup {
           PomodoroView(listTime: [
            Time(remainigTime: 1800, isPomodoro: true),
            Time(remainigTime: 300, isPomodoro: false)
        ])
        }
    }
}
