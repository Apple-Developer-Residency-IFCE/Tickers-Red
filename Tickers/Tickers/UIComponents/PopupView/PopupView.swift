//
//  PopupView.swift
//  Tickers
//
//  Created by Alley Pereira on 15/06/23.
//

import SwiftUI

struct PopupView: View {
    
    // MARK: - Properties
    @Binding var isShowing: Bool
    
    let titleText: String
    let contentText: String
    let cancelButtonText: String
    let confirmButtonText: String
    
    var confirmButtonAction: () -> Void
    var cancelButtonAction: () -> Void
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
            PopupContentView(
                isShowing: $isShowing,
                titleText: titleText,
                contentText: contentText,
                cancelButtonText: cancelButtonText,
                confirmButtonText: confirmButtonText,
                confirmButtonAction: confirmButtonAction,
                cancelButtonAction: cancelButtonAction
            )
        } //: ZStack
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - PreviewProvider
struct PopupView_Previews: PreviewProvider {
    @State static var isShowingPopup = true
    
    static var previews: some View {
        PopupView(
            isShowing: $isShowingPopup,
            titleText: "Você tem certeza que quer pular para o descanso?",
            contentText: "Essa decisão fará com que você interrompa seu pomodoro atual",
            cancelButtonText: "Não, me leve de volta",
            confirmButtonText: "Pular pomodoro",
            confirmButtonAction: {}, cancelButtonAction: {}
        )
    }
}
