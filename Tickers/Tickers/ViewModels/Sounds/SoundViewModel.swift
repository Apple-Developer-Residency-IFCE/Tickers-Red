//
//  SoundModelView.swift
//  Tickers
//
//  Created by Oliver Santos on 29/06/23.
//

import SwiftUI


class SoundViewModel: ObservableObject {
    @Published var sounds: [Sound] = [
        Sound(id: 0, title: "Chuva", isPlay: false, isDownload: false, path: "chuva"),
        Sound(id: 1, title: "Tempestade", isPlay: false, isDownload: true, path: "tempestade"),
        Sound(id: 2, title: "Água Corrente", isPlay: false, isDownload: true, path: "water"),
        Sound(id: 3, title: "Lo-fi", isPlay: false, isDownload: true, path: "lofi")
    ]
    
    func handleButtonPress(_ i: Int) {
        sounds[i].isPlay.toggle()
    }
    
    func selectMusicOption(_ selectedOption: Sound) {
        for index in sounds.indices {
            if(sounds[index].id == selectedOption.id){
                sounds[index].isPlay.toggle()
            } else {
                sounds[index].isPlay = false
            }
        }
        if(selectedOption.isPlay){
            SoundPlayer.shared.pauseMusic()
        }else{
            SoundPlayer.shared.playMusic(named: selectedOption.path)
        }
    }
}
