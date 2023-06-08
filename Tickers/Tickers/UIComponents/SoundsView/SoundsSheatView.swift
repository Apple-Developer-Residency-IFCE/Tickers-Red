//
//  SoundsSheatView.swift
//  Tickers
//
//  Created by Alley Pereira on 07/06/23.
//

import SwiftUI

// MARK: SoundsSheetView
struct SoundsSheetView: View {
    @State private var showingSounds = false
    @State private var buttonIsHidden = false
    @State private var selectedOption: String?
    
    let options = ["Chuva", "Tempestade", "Água Corrente", "Lo-fi"]
    
    var body: some View {
        ZStack {
            Button("Sons") {
                buttonIsHidden.toggle()
                withAnimation {
                    showingSounds.toggle()
                }
            }
            .opacity(buttonIsHidden ? 0 : 1)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        #if DEBUG
        .background(Color(uiColor: .secondarySystemBackground))
        #endif
        .bottomSheet(isPresented: $showingSounds) {
            VStack(alignment: .leading) {
                HStack(spacing: 0) {
                    Image("sounds")
                        .padding(.trailing, 12)
                    Text("Sons")
                        .foregroundColor(.blue)
                        .bold()
                    Spacer()
                    Image("exitGray")
                        .onTapGesture {
                            withAnimation {
                                showingSounds = false
                                buttonIsHidden = false
                            }
                        }
                }
                Divider()
                ForEach(options, id: \.self) { option in
                    OptionButton(title: option, isSelected: self.binding(for: option))
                        .onTapGesture {
                            selectedOption = option
                        }
                } //: ForEach
                Spacer()
            } //: VStack
            .tickerFont(size: 20, weight: .regular)
        } //: BottonSheet
    } //: BodyView
    
    // MARK: - Function of binding
    private func binding(for option: String) -> Binding<Bool> {
        Binding<Bool>(
            get: { self.selectedOption == option },
            set: { newValue in
                if newValue {
                    self.selectedOption = option
                } else if self.selectedOption == option {
                    self.selectedOption = nil
                }
            }
        )
    }//: func
}

// MARK: - Preview
struct SoundsSheatView_Previews: PreviewProvider {
    static var previews: some View {
        SoundsSheetView()
    }
}
