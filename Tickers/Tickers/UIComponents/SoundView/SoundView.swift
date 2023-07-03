//
//  SoundView.swift
//  Tickers
//
//  Created by Oliver Santos on 29/06/23.
//

import SwiftUI

struct SoundView: View {
    @ObservedObject var soundViewModel: SoundViewModel
    
    init(sounds: [Sound]) {
        let svm = SoundViewModel(sounds: sounds)
        self.soundViewModel = svm
    }
    
    var body: some View {
        VStack {
            ForEach(soundViewModel.sounds, id: \.self) { sounds in
                HStack {
                    Text("\(sounds.title)")
                        .padding(.leading, 20)
                    Spacer()
                    Image(sounds.isPlay ? "pauseSound" : "playSound").onTapGesture {
                        soundViewModel.selectMusicOption(sounds)
                    }
                    Image(sounds.isDownload ? "downloadSound" : "cancelSound")
                        .padding(.trailing, 20)
                }//: HStack
                .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height/14)
                .background(.gray)
                .cornerRadius(20)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            }
        }
    }
}

struct SoundView_Previews: PreviewProvider {
    static var previews: some View {
        SoundView(sounds: [
            Sound(id: 0, title: "Chuva", isDownload: false),
            Sound(id: 1, title: "Tempestade", isDownload: true),
            Sound(id: 2, title: "Água Corrente", isDownload: true),
            Sound(id: 3, title: "Lo-fi", isDownload: true)
        ])
    }
}
