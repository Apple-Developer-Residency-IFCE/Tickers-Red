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
           PomodoroView(listTime: TimeList(time: [
            Time(remainigTime: 1800, typeTimer: true),
            Time(remainigTime: 300, typeTimer: false)
        ]))
        }
    }
}
