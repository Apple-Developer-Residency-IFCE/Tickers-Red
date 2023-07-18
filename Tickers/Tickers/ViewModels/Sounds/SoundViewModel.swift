//
//  SoundModelView.swift
//  Tickers
//
//  Created by Oliver Santos on 29/06/23.
//

import SwiftUI


class SoundViewModel: ObservableObject {
    @Published var sounds: [Sound] = [
        Sound(id: 0, title: "Chuva", isDownload: false, path: URL(fileURLWithPath: Bundle.main.path(forResource: "chuva.mp3", ofType: nil)!)),
        Sound(id: 1, title: "Tempestade", isDownload: true, path: URL(fileURLWithPath: Bundle.main.path(forResource: "tempestade.mp3", ofType: nil)!)),
        Sound(id: 2, title: "Água Corrente", isDownload: true, path: URL(fileURLWithPath: Bundle.main.path(forResource: "water.mp3", ofType: nil)!)),
        Sound(id: 3, title: "Lo-fi", isDownload: true, path: URL(fileURLWithPath: Bundle.main.path(forResource: "lofi.mp3", ofType: nil)!))
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
