//
//  PopupContentView.swift
//  Tickers
//
//  Created by Alley Pereira on 16/06/23.
//

import SwiftUI

struct PopupContentView: View {
    let titleText: String
    let contentText: String
    let cancelButtonText: String
    let confirmButtonText: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text(titleText)
                .tickerFont(size: 22, weight: .bold)
                .foregroundColor(.customBlue)
                .padding([.leading, .trailing], 50)
                .multilineTextAlignment(.center)
            
            Text(contentText)
                .tickerFont(size: 15, weight: .regular)
                .padding([.leading, .trailing], 60)
            
            VStack {
                ConfirmBtn(text: cancelButtonText, filled: false, sizeTextBtn: 20)
                ConfirmBtn(text: confirmButtonText, filled: true, sizeTextBtn: 20)
            } //: VStack
            .frame(width: 240)
        } //: VStack
        .padding(.vertical, 40)
        .background(Color.white)
        .cornerRadius(20)
    } //: View
}

// MARK: - PreviewProvider
struct PopupContentView_Previews: PreviewProvider {
    static var previews: some View {
        PopupContentView(
            titleText: "Você tem certeza que quer pular para o descanso?",
            contentText: "Essa decisão fará com que você interrompa seu pomodoro atual",
            cancelButtonText: "Não, me leve de volta",
            confirmButtonText: "Pular pomodoro"
        )
    }
}
