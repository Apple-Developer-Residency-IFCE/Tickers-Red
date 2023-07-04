//
//  SoundModelView.swift
//  Tickers
//
//  Created by Oliver Santos on 29/06/23.
//

import SwiftUI

class SoundViewModel: ObservableObject {
    @Published var sounds: [Sound] = [
        Sound(id: 0, title: "Chuva", isDownload: false),
        Sound(id: 1, title: "Tempestade", isDownload: true),
        Sound(id: 2, title: "Água Corrente", isDownload: true),
        Sound(id: 3, title: "Lo-fi", isDownload: true)
    ]
    
    func handleButtonPress(_ i: Int) {
        sounds[i].isPlay.toggle()
    }
    
    func selectMusicOption(_ selectedOption: Sound) {
        for index in sounds.indices {
            sounds[index].isPlay = sounds[index].id == selectedOption.id
        }
    }
}
