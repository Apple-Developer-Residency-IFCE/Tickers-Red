//
//  SoundsSheatView.swift
//  Tickers
//
//  Created by Alley Pereira on 07/06/23.
//

import SwiftUI

struct SoundsSheet: View {
    let sounds: [Sound] = [
        Sound(title: "Chuva", isPause: true, isDownload: false),
        Sound(title: "Tempestade", isPause: false, isDownload: true),
        Sound(title: "Água Corrente", isPause: false, isDownload: true),
        Sound(title: "Lo-fi", isPause: false, isDownload: true)
    ]
    
    let options = ["Chuva", "Tempestade", "Água Corrente", "Lo-fi"]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Divider()
                HStack(spacing: 0) {
                    Image("sounds")
                        .padding(.leading, 20)
                        .padding(.trailing, 15)
                    Text("Sons")
                        .foregroundColor(.blue)
                }
                .padding(.top, 15)
                .padding(.bottom, 5)
                ForEach(sounds, id: \.self) { sounds in
                    Text(".\(sounds.title)")
                } //: ForEach
                Spacer()
            } //: VStack
            .navBarWithBackButton(blackText: "Pomodoro")
        }
    }
}

struct Sound: Hashable {
    let title: String
    let isPause: Bool
    let isDownload: Bool
}

// MARK: - Preview
struct SoundsModalView_Previews: PreviewProvider {
    static var previews: some View {
        SoundsSheet()
    }
}
