//
//  TimerViewComponent.swift
//  Tickers
//
//  Created by Alley Pereira on 29/05/23.
//

import SwiftUI

// Quando finalizado, será usado na ContentView
struct TimerViewComponent: View {
    
    // dados mockados pra desenvolvimento
    @State var timers: [TimeInterval] = [
        25.0, // pomodoro 1
        5.0,  // pausa curta
        25.0, // pomodoro 2
        5.0,  // pausa curta
        25.0, // pomodoro 3
        5.0,  // pausa curta
        25.0, // pomodoro 4
        15.0  // pausa longa
    ]
    
    @State var currentTimer: TimeInterval = 0
    
     func getNextTimer() -> TimeInterval {
        guard !timers.isEmpty else { return 0 }
        return timers.removeFirst()
    }
    
    var body: some View {
        TimerView(durationInSecond: getNextTimer(), endTimerHandler: {
            self.currentTimer = self.getNextTimer()
        })
    }
}

struct TimerViewComponent_Previews: PreviewProvider {
    static var previews: some View {
        TimerViewComponent()
    }
}
