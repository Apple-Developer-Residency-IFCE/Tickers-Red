//
//  TickersActivityLiveActivity.swift
//  TickersActivity
//
//  Created by Julia Morales on 24/07/23.
//

import Foundation
import ActivityKit
import WidgetKit
import SwiftUI

struct TickersActivityAttributes: ActivityAttributes {
    
    public typealias TimeTrackingStatus = ContentState
    
    public struct ContentState: Codable, Hashable {
        var timer: TimeInterval
    }
}
