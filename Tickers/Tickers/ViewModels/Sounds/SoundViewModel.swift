//
//  SoundModelView.swift
//  Tickers
//
//  Created by Oliver Santos on 29/06/23.
//

import SwiftUI


class SoundViewModel: ObservableObject {
    @Published var sounds: [Sound] = [
        Sound(id: 0, title: "Chuva", isDownload: false, path: Bundle.main.url(forResource: "chuva", withExtension: "mp3")),
        Sound(id: 1, title: "Tempestade", isDownload: true, path: Bundle.main.url(forResource: "tempestade", withExtension: "mp3")),
        Sound(id: 2, title: "Água Corrente", isDownload: true, path: Bundle.main.url(forResource: "water", withExtension: "mp3")),
        Sound(id: 3, title: "Lo-fi", isDownload: true, path:  Bundle.main.url(forResource: "lofi", withExtension: "mp3"))
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
