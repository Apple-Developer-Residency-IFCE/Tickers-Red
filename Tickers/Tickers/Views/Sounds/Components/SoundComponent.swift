//
//  SoundView.swift
//  Tickers
//
//  Created by Oliver Santos on 29/06/23.
//

import SwiftUI

struct SoundComponent: View {
    @ObservedObject var soundViewModel: SoundViewModel
    
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

struct SoundComponent_Previews: PreviewProvider {
    static var previews: some View {
        SoundComponent(soundViewModel: SoundViewModel())
    }
}
