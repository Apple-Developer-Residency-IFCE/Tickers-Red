//
//  PopupView.swift
//  Tickers
//
//  Created by Alley Pereira on 15/06/23.
//

import SwiftUI

struct PopupView: View {
    
    // MARK: - Properties
    private let color = Color(
        red: 59 / 255,
        green: 129 / 255,
        blue: 235 / 255
    )
    
    let titleText: String
    let contentText: String
    let cancelButtonText: String
    let confirmButtonText: String
    
    init(
        titleText: String,
        contentText: String,
        cancelButtonText: String,
        confirmButtonText: String
    ) {
        self.titleText = titleText
        self.contentText = contentText
        self.cancelButtonText = cancelButtonText
        self.confirmButtonText = confirmButtonText
    }
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
            
            VStack(spacing: 20) {
                Text(titleText)
                    .tickerFont(size: 22, weight: .bold)
                    .foregroundColor(color)
                    .padding([.leading, .trailing], 50)
                    .multilineTextAlignment(.center)
                
                Text(contentText)
                    .tickerFont(size: 15, weight: .regular)
                    .padding([.leading, .trailing], 60)
                
                VStack {
                    ConfirmBtn(text: cancelButtonText, filled: false, sizeTextBtn: 20)
                    ConfirmBtn(text: confirmButtonText, filled: true, sizeTextBtn: 20)
                }
                .frame(width: 240)
            } //: VStack
            .padding(.vertical, 40)
            .background(Color.white)
            .cornerRadius(20)
        } //: ZStack
        .edgesIgnoringSafeArea(.all)
    } //: View
}


// MARK: - PreviewProvider
struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView(
            titleText: "Você tem certeza que quer pular para o descanso?",
            contentText: "Essa decisão fará com que você interrompa seu pomodoro atual",
            cancelButtonText: "Não, me leve de volta",
            confirmButtonText: "Pular pomodoro"
        )
    }
}
