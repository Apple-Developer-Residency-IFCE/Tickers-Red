//
//  PomodoroPopupFactory.swift
//  Tickers
//
//  Created by Alley Pereira on 19/06/23.
//

import SwiftUI

class PomodoroPopupFactory: ObservableObject {
    
    enum PopupKind {
        case reset
        case skipPomo
        case skipRest
    }
    
    @ObservedObject var viewModel: PomodoroViewModel
    
    private var popupToShow: PopupKind
    
    init(viewModel: PomodoroViewModel) {
        self.viewModel = viewModel
        self.popupToShow = .reset
    }
    
    func make() -> some View {
        switch popupToShow {
        case .reset:
            return onResetAlert()
        case .skipRest:
            return onSkipRestAlert()
        case .skipPomo:
            return onSkipPomoAlert()
        }
    }
    
    func show(_ popup: PopupKind) {
        popupToShow = popup
        viewModel.isShowingPopup = true
    }
    
    func onResetAlert() -> PopupView {
        PopupView(
            isShowing: $viewModel.isShowingPopup,
            titleText: "Você tem certeza que quer reiniciar seu timer?",
            contentText: "Essa decisão fará com que você perca o progresso do tempo atual",
            cancelButtonText: "Não, me leve de volta",
            confirmButtonText: "Reiniciar timer",
            confirmButtonAction: {
                self.viewModel.onReset()
            },
            cancelButtonAction: { }
        )
    }
    
    func onSkipRestAlert() -> PopupView {
        PopupView(
            isShowing: $viewModel.isShowingPopup,
            titleText: "Você tem certeza que quer pular para o pomodoro?",
            contentText: "Essa decisão fará com que você interrompa sua pausa atual",
            cancelButtonText: "Não, me leve de volta",
            confirmButtonText: "Pular pausa",
            confirmButtonAction: {
                self.viewModel.onSkip()
            },
            cancelButtonAction: { }
        )
    }
    
    func onSkipPomoAlert() -> PopupView {
        PopupView(
            isShowing: $viewModel.isShowingPopup,
            titleText: "Você tem certeza que quer pular para o descanso?",
            contentText: "Essa decisão fará com que você interrompa seu pomodoro atual",
            cancelButtonText: "Não, me leve de volta",
            confirmButtonText: "Pular pomodoro",
            confirmButtonAction: {
                self.viewModel.onSkip()
            },
            cancelButtonAction: { }
        )
    }
}
