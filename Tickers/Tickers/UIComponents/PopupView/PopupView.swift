//
//  PopupView.swift
//  Tickers
//
//  Created by Alley Pereira on 15/06/23.
//

import SwiftUI

struct PopupView: View {
    
    // MARK: - Properties
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
            PopupContentView(
                titleText: titleText,
                contentText: contentText,
                cancelButtonText: cancelButtonText,
                confirmButtonText: confirmButtonText
            )
        } //: ZStack
        .edgesIgnoringSafeArea(.all)
    }
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
