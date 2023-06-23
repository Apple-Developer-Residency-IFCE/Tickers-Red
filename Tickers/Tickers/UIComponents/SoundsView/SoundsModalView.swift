//
//  SoundsSheatView.swift
//  Tickers
//
//  Created by Alley Pereira on 07/06/23.
//

import SwiftUI

struct SoundsSheet: View {
    @State private var isPresented = false
    
    var body: some View {
        VStack {
            Button("Apresentar") {
                isPresented = true
            }
            if isPresented {
                SoundsModalView(isPresented: $isPresented)
                    .transition(.move(edge: .bottom))
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

// MARK: SoundsSheetView
struct SoundsModalView: View {
    @Binding var isPresented: Bool
    
    @State private var selectedOption: String?
    
    let options = ["Chuva", "Tempestade", "Água Corrente", "Lo-fi"]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 0) {
                Image("sounds")
                    .padding(.leading, 20)
                    .padding(.trailing, 15)
                Text("Sons")
                    .foregroundColor(.blue)
                Spacer()
                Image("exitGray")
                    .padding(.trailing, 20)
                    .onTapGesture {
                        withAnimation {
                            isPresented = false
                        }
                    }
            }
            .padding(.top, 15)
            .padding(.bottom, 5)
            Divider()
            ForEach(options, id: \.self) { option in
                OptionButton(title: option, isSelected: option == selectedOption)
                    .padding(.leading, 20)
                    .onTapGesture {
                        selectedOption = option
                    }
            } //: ForEach
            Spacer()
        } //: VStack
        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 2)
        .background(Color.white)
        .ignoresSafeArea()
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding(.bottom, -(UIScreen.main.bounds.width))
    }
}

// MARK: - Preview
struct SoundsModalView_Previews: PreviewProvider {
    static var previews: some View {
        SoundsSheet()
    }
}
