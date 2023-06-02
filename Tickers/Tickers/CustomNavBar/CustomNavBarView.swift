//
//  CustomNavBarView.swift
//  Tickers
//
//  Created by userext on 29/05/23.
//

import SwiftUI

struct CustomNavBar: View {
    @Environment(\.presentationMode) var presentationMode
    let showReturnButton: Bool
    let textBlack: String
    let textBlue: String
    let showMissions: Bool
    
    var body: some View {
        VStack {
            HStack {
                if showReturnButton {
                    returnButton
                }
                Text(textBlack)
                    .tickerFont(size: 24, weight: .bold)
                Text(textBlue)
                    .tickerFont(size: 24, weight: .bold)
                    .foregroundColor(.blue)
                Spacer()
                if showMissions {
                    missions
                }
            }
            .padding(10)
            .background(
                Color.clear.ignoresSafeArea(edges: .top)
            )
            Divider()
        }
    }
}

struct CustomNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            CustomNavBar(showReturnButton: false, textBlack: "Teste Testando", textBlue: "oie", showMissions: true)
            Spacer()
        }
    }
}

extension CustomNavBar {
    
    private var returnButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image("returnArrow")
        })
    }
    
    private var missions: some View {
        Button {
            print("logica aqui")
        } label: {
            Image("missions")
        }

    }
}
