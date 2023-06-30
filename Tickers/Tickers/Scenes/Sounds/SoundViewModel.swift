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
    
    func handleButtonPress(_ i: Int) {
        sounds[i].isPlay.toggle()
    }
    
    func selectMusicOption(_ selectedOption: Sound) {
        for index in sounds.indices {
            sounds[index].isPlay = sounds[index].id == selectedOption.id
        }
    }
}
