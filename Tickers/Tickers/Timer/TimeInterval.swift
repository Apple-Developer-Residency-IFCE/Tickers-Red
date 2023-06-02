//
//  TimeInterval+Ext.swift
//  Tickers
//
//  Created by Alley Pereira on 26/05/23.
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
