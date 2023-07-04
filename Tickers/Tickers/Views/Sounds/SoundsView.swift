//
//  SoundsSheatView.swift
//  Tickers
//
//  Created by Alley Pereira on 07/06/23.
//

import SwiftUI

struct SoundsView: View {
    @ObservedObject var sounds: SoundViewModel
    
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
                .padding(.bottom, 35)
                SoundComponent(soundViewModel: sounds)
                Spacer()
            } //: VStack
            .navBarWithBackButton(blackText: "Pomodoro")
        }
        .navigationBarBackButtonHidden(true)
    }
    
    var optionSound: some View {
        HStack(){
            Text("Chuva")
                .padding(.leading, 20)
            Spacer()
            Image("playSound")
            Image("downloadSound")
                .padding(.trailing, 20)
        }//: HStack
        .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height/14)
        .background(.gray)
        .cornerRadius(20)
        .padding(.leading, 20)
        .padding(.trailing, 20)
        .padding(.top, 10)
        .padding(.bottom, 10)
    }
}

// MARK: - Preview
struct SoundsView_Previews: PreviewProvider {
    static var previews: some View {
        SoundsView(sounds: SoundViewModel())
    }
}
