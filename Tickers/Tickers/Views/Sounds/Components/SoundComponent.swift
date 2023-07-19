//
//  SoundView.swift
//  Tickers
//
//  Created by Oliver Santos on 29/06/23.
//

import SwiftUI
import AVFoundation

struct SoundComponent: View {
    @ObservedObject var soundViewModel: SoundViewModel
    @State private var audioPlayer: AVAudioPlayer?
    @State var musicSelected: Int?
    
    var body: some View {
        VStack {
            ForEach(soundViewModel.sounds, id: \.self) { sounds in
                HStack {
                    Text("\(sounds.title)")
                        .padding(.leading, 20)
                    Spacer()
                    Button(action: {
                        if let path = sounds.path {
                            do {
                                audioPlayer = try AVAudioPlayer(contentsOf: path)
                                audioPlayer?.prepareToPlay()
                            } catch {
                                print("Erro ao inicializar o AVAudioPlayer: \(error.localizedDescription)")
                            }
                        }
                        if(!(musicSelected == sounds.id)){
                            soundViewModel.selectMusicOption(sounds)
                            if(sounds.isPlay){
                                audioPlayer?.pause()
                            }else{
                                audioPlayer?.numberOfLoops = -1
                                audioPlayer?.play()
                            }
                            musicSelected = sounds.id
                        }else {
                            soundViewModel.handleButtonPress(sounds.id)
                            if(sounds.isPlay){
                                audioPlayer?.pause()
                            }else{
                                audioPlayer?.numberOfLoops = -1
                                audioPlayer?.play()
                            }
                        }
                    }) {
                        Image(sounds.isPlay ? "pauseSound" : "playSound")
                        .padding(.trailing, 20)
                    }//: HStack
                }
                .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height/14)
                .background(.gray)
                .cornerRadius(20)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            }
        }
    }
}

struct SoundComponent_Previews: PreviewProvider {
    static var previews: some View {
        SoundComponent(soundViewModel: SoundViewModel())
    }
}
