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
                    Image(sounds.isPlay ? "playSound" : "pauseSound")
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
            Sound(title: "Chuva", isPlay: true, isDownload: false),
            Sound(title: "Tempestade", isPlay: false, isDownload: true),
            Sound(title: "Água Corrente", isPlay: false, isDownload: true),
            Sound(title: "Lo-fi", isPlay: false, isDownload: true)
        ])
    }
}
