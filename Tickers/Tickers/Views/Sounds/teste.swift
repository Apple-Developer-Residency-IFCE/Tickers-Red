//
//  teste.swift
//  Tickers
//
//  Created by Oliver Santos on 18/07/23.
//

import SwiftUI
import AVFoundation


struct teste: View {
    @State private var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        HStack{
            Button(action: {
            if let player = audioPlayer {
                if player.isPlaying {
                    player.pause()
                } else {
                    audioPlayer?.numberOfLoops = -1
                    player.play()
                }
            }
        }) {
            Text(audioPlayer?.isPlaying ?? false ? "Pausar" : "Reproduzir")
        }        }
        .onAppear {
            if let path = Bundle.main.url(forResource: "water", withExtension: "mp3") {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: path)
                    audioPlayer?.prepareToPlay()
                } catch {
                    print("Erro ao inicializar o AVAudioPlayer: \(error.localizedDescription)")
                }
            }
        }
    }
}

struct teste_Previews: PreviewProvider {
    static var previews: some View {
        teste()
    }
}
