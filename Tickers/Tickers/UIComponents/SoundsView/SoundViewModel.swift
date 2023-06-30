//
//  SoundModelView.swift
//  Tickers
//
//  Created by Oliver Santos on 29/06/23.
//

import SwiftUI

class SoundViewModel: ObservableObject {
    @Published var sounds: [Sound]
    
    init(sounds: [Sound]) {
        self.sounds = sounds
    }
}
