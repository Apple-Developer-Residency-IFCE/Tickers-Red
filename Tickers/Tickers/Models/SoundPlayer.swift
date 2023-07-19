//
//  SoundPlayerModel.swift
//  Tickers
//
//  Created by Oliver Santos on 17/07/23.
//

import AVFoundation

class SoundPlayer {
    static let shared = SoundPlayer()
    private var audioPlayer: AVAudioPlayer?
    
    private init(){}
    
    func playMusic(named fileName: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.play()
        } catch {
            print("Erro ao reproduzir música: \(error.localizedDescription)")
        }
    }
    
    func pauseMusic() {
        audioPlayer?.pause()
    }
    
}
