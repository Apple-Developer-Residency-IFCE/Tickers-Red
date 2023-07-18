//
//  DefinitionsView.swift
//  Tickers
//
//  Created by Ian Pacini on 23/06/23.
//

import SwiftUI

struct DefinitionsView: View {
    @Binding var isPresentingDefinitions: Bool
    @StateObject private var viewModel = DefinitionsViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        bottomSheetContent
//        if #available(iOS 16.0, *) {
//            bottomSheetContent
//                .presentationDetents([.height(300)])
//        } else {
//            bottomSheetContent
//        }

            .onDisappear {
                viewModel.saveTemposDefinidos()
            }
    }
    
    var bottomSheetContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image("hourglassWPencil")
                Text("Definições")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Blue2"))
                Spacer()
                Image("exitGray")
                    .onTapGesture {
                        dismiss()
                    }
                    .padding(.trailing, 30)
            }
            .padding(.leading, 30)
            
            Divider()
            
            SliderComponent(
                valorAtual: $viewModel.focusTime,
                title: "Tempo de foco",
                minValue: 15,
                maxValue: 50,
                valueType: "min"
            )
            
            SliderComponent(
                valorAtual: $viewModel.shortRest,
                title: "Descanso",
                minValue: 4,
                maxValue: 10,
                valueType: "min"
            )
        }
        .interactiveDismissDisabled()
    }
}

fileprivate struct DefinitionsBinding: View {
    @State private var viewModel = DefinitionsViewModel()
    @State var isPresentingDefinitions: Bool = true
    var body: some View {
        DefinitionsView(isPresentingDefinitions: $isPresentingDefinitions)
            .onDisappear {
                viewModel.saveTemposDefinidos()
            }
    }
}

struct DefinitionsView_Previews: PreviewProvider {
    static var previews: some View {
        DefinitionsBinding()
    }
}
