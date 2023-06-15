//
//  TimerInterval.swift
//  Tickers
//
//  Created by Oliver Santos on 13/06/23.
//

import Foundation

extension TimeInterval {
    var timeString: String {
        let time = Int(self)
        
        struct TimeComponents {
            private(set) var seconds: Int
            private(set) var minutes: Int
        }
        
        let components = TimeComponents(seconds: time % 60, minutes: (time / 60) % 60)
        
        let formattedMinutes = String(format: "%02d", components.minutes)
        let formattedSeconds = String(format: "%02d", components.seconds)
        
        return "\(formattedMinutes):\(formattedSeconds)"
    }
}
